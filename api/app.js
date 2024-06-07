/*** IMPORT */
const express = require('express')
const cors = require('cors')

/*** PARAM */
const app = express()

app.disable("x-powered-by");

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: true}))

/*** IMPORT ROUTER */
const user_router = require('./routes/user_r')

/*** ROUTAGE */

app.get('/', (req, res) => res.send("Ratatouf is online !!!! Mais c'est pas la bonne image"))

app.use('/users', user_router)

app.all('*', (req, res) => res.status(501).send('What the hell are you doing bro !'))

module.exports = app