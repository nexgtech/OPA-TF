const express = require('express');
const bodyParser = require('body-parser')

const app = express();
const port = 3000;

app.use(bodyParser.json())

app.post('/logs', (request, response) => {
  console.log(JSON.stringify(request.body, null, 2));
  response.sendStatus(200);
});

app.listen(port, err => {
  if (err) {
    return console.log('something bad happened', err);
  }

  console.log(`server is listening on ${port}`);
});