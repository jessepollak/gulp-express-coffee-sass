express = require 'express'
logger = require 'morgan'

app = express()

app.use(logger('dev'))
app.use(express.static(__dirname + '/static'))
app.engine('.html', require('ejs').__express)
app.set('views', __dirname + '/views')
app.set('view engine', 'html')

app.get '/', (req, res) ->
    res.render 'index'

app.listen(3000)