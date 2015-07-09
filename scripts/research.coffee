request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /(.* .*) (.*) (.*)$/i, (msg) ->
   exp = msg.match[1]
   foil = msg.match[2]
   name = msg.match[3]
   console.log msg.match[1]
   console.log msg.match[2]
   console.log msg.match[3]
   ###
   options =
    url:
    'http://www.mtggoldfish.com/price/' + exp + '/' + foil + '/' +name
       console.log options
       timeout: 2000
       headers: {'user-agent': 'node title fetcher'}

   request options, (error, response, body) ->
    $ = cheerio.load body

    console.log response
    rsl = []
    if $('.style').text() is "404 Page Not Found"
     msg.send("error")
    unless $('.style').text() is "404 Page Not Found"
       $('.price-card-current-prices').each (i, elm) ->
         rsl[i] = $(this).text()
     msg.send(rsl)
     ###