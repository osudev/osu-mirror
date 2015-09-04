require! mongoose
{Schema} = mongoose

BeatmapSet = mongoose.model 'Beatmap_Set', {
  beatmapset_id:
    type: Number
    index: true
    unique: true
  beatmaps: [
    type: Schema.Types.ObjectId
    ref: 'Beatmap'
  ]
}

module.exports = BeatmapSet
