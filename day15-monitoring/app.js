const express = require('express');
const client = require('prom-client');

const app = express();
const PORT = 3000;

// collect default metrics (CPU, memory etc.)
client.collectDefaultMetrics();

// simple route
app.get('/', (req, res) => {
  res.send("Hello from Node.js App 🚀");
});

// metrics endpoint (IMPORTANT)
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', client.register.contentType);
  res.end(await client.register.metrics());
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});