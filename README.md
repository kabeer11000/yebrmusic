# Kabeer's Music
Code has been split into Microservices Directories
for running them simultaneously on different Ports
will be adding docker files afterwards to start everything with just a ```docker-compose up``` command


## Documentation: 
All Documentation and About 
https://developers.kabeersnetwork.tk/#/docs/music

### Default Ports 
Servers Check for process.env.PORT or use default ports

| Service     | Default Port |
| ----------- | -----------  |
| Backend     | 9000         |
| Cast-Server   | 3240       |
| Client/Frontend   | 3000   |
| Proxy-Server   | 8080      |
| Recom-API   | 5000         |


### Running Locally
Running Servers Locally - ```user-accounts-api``` will not work as it is just a concept
#### Back End
```
$ npm run dev
```
#### Proxy Server
```
$ npm run dev
```
#### Front End
```
$ npm start
```

Data collection server is composer with PHP. I used xampp for development - ```httpd.conf```

---
Copyright 2020  Kabeers Network. 
Code Under MIT License
https://kabeersnetwork.tk
