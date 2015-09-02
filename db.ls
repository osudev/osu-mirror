require! mongoose
require! 'require-dir'
require! './config'

mongoose.connect config.mongodb
module.exports = requireDir './modles'
