const express = require('express');
const app = express();

// Define the redirect route
app.get('/callback', (req, res) => {
  const code = req.query.code;
  const error = req.query.error;

  if (error) {
    res.send(`Callback received an error: ${error}`);
  } else {
    res.send(`Callback received a code: ${code}`);
  }
});

// Example home route
app.get('/', (req, res) => {
  res.send('Home Page');
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
