# Proxy Server CodeBase

The proxy microservice for Kabeer's Music / Yebr Music
Required when proxying song streams form googlevideo.com
and when downloading youtube thumbnails


A cors-anywhere based node app is in the root directory

``cloudflare-version.js`` which is an implementation of cors-anywhere that runs inside a cloudflare worker instance



| File     | Description   |
| ----------- | -----------    |
| server.js     | Node based cors-anywhere |
| cloudflare-version   | Cloudflare worker based proxy|

