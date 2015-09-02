require! request
require! './config'

json_api = (method, query, callback) ->
  query.k = config.api_key
  request do
    json: true
    url: "https://osu.ppy.sh/api/#{method}"
    qs: query
    , (err, res, data) ->
      callback err, data

module.exports =
  get_beatmapset: (id, callback) ->
    json_api 'get_beatmaps', s: id, callback
