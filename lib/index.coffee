fs = require 'fs'
path = require 'path'
nodefn = require 'when/node'

class File
  constructor: (@path) ->

  ###*
   * Read from the file
   * @param {String|null} [options.encoding=null]
   * @param {String} [options.flag='r']
   * @return {Promise}
  ###
  read: (options = {}) ->
    nodefn.call(fs.readFile, @path, options)

  ###*
   * Write `data` to the file
   * @param {String|Buffer} data
   * @param {String|null} [options.encoding='utf8'] ignored if data is a
     buffer
   * @param {Number} [options.mode=438] default is 0666 in Octal
   * @param {String} [options.flag='w']
   * @return {Promise}
  ###
  write: (data, options = {}) ->
    nodefn.call(fs.writeFile, @path, data, options)

  ###*
   * Append `data` to the file
   * @param {String|Buffer} data
   * @param {String|null} [options.encoding='utf8'] ignored if data is a
     buffer
   * @param {Number} [options.mode=438] default is 0666 in Octal
   * @param {String} [options.flag='w']
   * @return {Promise}
  ###
  append: (data, options = {}) ->
    nodefn.call(fs.appendFile, @path, data, options)

  ###*
   * Rename the file
   * @param {String} newPath The new path for the file. Will be resolved relative to
     File.base.
   * @return {Promise}
  ###
  rename: (newPath) ->
    nodefn.call(fs.rename, @path, newPath).then( => @path = newPath)

  ###*
   * Delete the file
   * @return {Promise}
  ###
  unlink: ->
    nodefn.call(fs.unlink, @path)

  ###*
   * Return a Stat object for the file
   * @return {Promise}
  ###
  stat: ->
    nodefn.call(fs.stat, @path)

  ###*
   * Get the extension of a file
   * @return {String}
  ###
  extname: ->
    path.extname(@path)

  ###*
   * Get the dirname of the file
   * @return {String}
  ###
  dirname: ->
    path.dirname(@path)

module.exports = File
