request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /title (.*)/i, (msg) ->
   url = msg.match[1]
   options =   
       url: url
       timeout: 2000
       headers: {'user-agent': 'node title fetcher'}

   console.log request
   request options, (error, response, body) ->
    $ = cheerio.load body
    rsl $('').forEach.(function(elm){  rsl.push( elm.text().replace(/\n/g, ''))})
    msg.send(rsl)