request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /(.*) (.*)/i, (msg) ->
   exp = msg.match[1]
   name = msg.match[2]
   options =   
       url: 'http://www.mtggoldfish.com/price/' + exp + '/' +name
       timeout: 2000
       headers: {'user-agent': 'node title fetcher'}

   request options, (error, response, body) ->
    $ = cheerio.load body
    
    rsl = []
    $('.price-card-current-prices').each (i, elm) ->
        rsl[i] = $(this).text()
        
    msg.send(rsl)