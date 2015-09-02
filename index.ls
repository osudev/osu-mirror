require! kue
require! './db'
require! './osu'
require! './config'

queue = kue.createQueue do
  redis: config.redis

queue.process 'get_beatmapset', (job, done) ->
  osu.get_beatmapset job.data, (err, beatmaps) ->
    return done err if err
    done null, {id: job.data, beatmaps}

queue.process 'save_beatmapset', (job, done) ->
  console.log 'saving:', job.data
  done!

get_beatmapset = (id) ->
  job = queue.create 'get_beatmapset', id
  job.on 'complete', (beatmapset) ->
    save_beatmapset beatmapset
    get_beatmapset ++id
  job.on 'failed', ->
    setTimeout ->
      get_beatmapset id
    , 10000
  job.save!

save_beatmapset = (beatmapset) ->
  job = queue.create 'save_beatmapset', beatmapset
  job.save!

get_beatmapset 1
