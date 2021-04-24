
# Kabeer's Music ![Kabeers Music Logo](.github/assets/icon.svg)
Code has been split into Microservices Directories
for running them simultaneously on different Ports
will be adding docker files afterwards to start everything with just a ```docker-compose up``` command


## Documentation: 
All Documentation and About 
https://developers.kabeersnetwork.tk/#/docs/music

### Default Ports 
Servers Check for process.env.PORT or use default ports

| Service     | Default Port   |
| ----------- | -----------    |
| Backend     | 9000           |
| Cast-Server   | 3240         |
| Client/Frontend   | 3000     |
| Data-Collection-Server  | 80 |
| Proxy-Server   | 8080        |
| Recommendation-API   | 5000  |


### Running Locally
Running Servers Locally - ```user-accounts-api``` will not work as it is just a concept.

```recom-api``` was a concept and is deprecated and will be deleted. ```recommendation-api``` is a production version of these concepts.
#### Back End
Main API server - Handles Auth, and Other App actions

express based Node Server
```
$ npm run dev
```
#### Proxy Server
Proxy Requests where necessary

cors-anywhere based Node server
```
$ npm run dev
```
#### Cast Server
Kabeer Cast(R) Server Microservice.
Allows for Cast feature within the app. 

socket-io based Node server
```
$ npm run dev
```
#### Recommendation API
Python flask based Server Microservice.
Serves Tensorflow and Scikit models for 
recommendations and candidate generation

flask based Python server
```
$ npm run dev
```
#### Data Collection Server
Microservice for collecting and analyzing user activity for recommendations

Data collection server is composer with PHP. We used xampp for development - Please see: ```httpd.conf```
PHP running on Apache Server
```
$ npm run dev
```
#### Front End
Frontend - Client Side code made with React Framework
```
$ npm start
```


---
Copyright (c) 2021  Kabeer's Network. 

Code Under MIT License - https://kabeersnetwork.tk
