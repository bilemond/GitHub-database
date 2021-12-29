/* eslint-disable @typescript-eslint/no-var-requires */
const userApi = require('./api/userApi');
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const express = require('express');
const http = require('http');

const app = express();
let server = http.createServer(app);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }))

app.use('/api', userApi);

server.listen(8888, () => {
    console.log('success!! port:8888')
})

console.log('success listen at port:3000')