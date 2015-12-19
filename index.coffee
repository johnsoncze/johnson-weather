express = require 'express'
request = require 'request'
app = express()

app.get '/', (req, res) ->
    res.send 'Hello World!'

app.get '/:city([\-\\w]+)', (req, done) ->
    request
        uri: "http://api.openweathermap.org/data/2.5/weather?q=#{req.params.city}&appid=c21c42236cf4d809f22e656dc8dc1426"
        method: 'GET'
    , (err, res, body) ->
        done.send body

server = app.listen 3000, ->
    host = server.address().address;
    port = server.address().port;
    console.log 'Example app listening at http://%s:%s', host, port