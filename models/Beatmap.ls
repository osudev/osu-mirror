require! mongoose
{Schema} = mongoose

Beatmap = mongoose.model 'Beatmap', {
  beatmap_id:
    type: Number
    index: true
    unique: true
  beatmap_set:
    type: Schema.Types.ObjectId
    ref: 'Beatmap_Set'
  beatmapset_id: Number
  approved: Number
  approved_date: Date
  last_update: Date
  total_length: Number
  hit_length: Number
  version: String
  artist: String
  title: String
  creator: String
  bpm: Number
  source: String
  difficultyrating: Number
  diff_size: Number
  diff_overall: Number
  diff_approach: Number
  diff_drain: Number
  mode: Number
  genre_id: Number
  language_id: Number
  file_md5: String
  favourite_count: Number
  playcount: Number
  passcount: Number
  max_combo: Number
}

module.exports = Beatmap
