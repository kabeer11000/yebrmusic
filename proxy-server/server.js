// Listen on a specific host via the HOST environment variable
const host = process.env.HOST || '0.0.0.0';
// Listen on a specific port via the PORT environment variable
const port = process.env.PORT || 8080;
const proxy = require('cors-anywhere');

proxy.createServer({
    originWhitelist: ["", "http://localhost:3000"], // Allow all origins
    // requireHeader: ['origin', 'x-requested-with'],
    // removeHeaders: ['cookie', 'cookie2']
}).listen(port, host, () => console.log('Running CORS Anywhere on ' + host + ':' + port));
