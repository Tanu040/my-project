// server.js

// Import required packages
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const PORT = 3000;

// Middleware
app.use(cors()); // Enable CORS for all routes
app.use(bodyParser.json()); // Parse JSON request bodies
app.use(bodyParser.urlencoded({ extended: true })); // Parse URL-encoded request bodies

// Routes
app.get('/', (req, res) => {
  res.send('Hello World! Server is running.');
});

app.post('/data', (req, res) => {
  const receivedData = req.body; // Access data sent in the request body
  console.log(receivedData);
  res.json({ message: 'Data received successfully', data: receivedData });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
