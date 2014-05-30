express = require 'express'
logger = require 'morgan'
partials = require 'express-partials'

app = express()

app.use(logger('dev'))
app.use(express.static(__dirname + '/static'))
app.use(partials())
app.engine('.html', require('ejs').__express)
app.set('views', __dirname + '/views')
app.set('view engine', 'html')

app.get '/', (req, res) ->
    res.render 'index', layout: 'base'

app.listen(process.env.PORT or 3000)
