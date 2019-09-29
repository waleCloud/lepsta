# Lepsta Developer code session - Development to Production 
[![Build Status](https://travis-ci.org/waleCloud/lepsta.svg?branch=staging)](https://travis-ci.org/waleCloud/lepsta)

A minimal api developed for the lepsta developer session on Saturday 28th of September 2019, titled `from development to production`.
* [Presentation slides here](https://docs.google.com/presentation/d/1FU0f-3Xd-4NgblomPzHeU3tk7d3dOhqbgSvDdbBs_rs/edit?usp=sharing)

* [Docker Image](https://hub.docker.com/r/walecloud/lepsta/builds)

## Quick setup
* `git clone https://github.com/waleCloud/lepsta`
* `cd lepsta`
* `cp .env.example .env` - Listens on PORT 9000 by default.
* `npm install`
* `npm test` - To run tests
* `npm start` - Your app should be running on http://localhost:9000/

## Docker build local
* `docker build -f Dockerfile -t lepsta:staging`.
* `docker run -p 9000:9000 lepsta/staging`
*  Your app should be running on http://localhost:9000/

### Folder structure
- **app** [dir] - application folder
    -  **config** - `config.js`::sequelize configuration file 
    -  **controllers** - application controllers folder, app logic goes here
    -  **helpers** - helper scripts to ease repetitive tasks goes here.
    -  **migrations** - database migration files
    -  **models** - application database models definition goes here
    -  **routes** - application requests, requests format and definition goes
        -   to carefully house all your api routes file
        -   `hello.js` - hello default route (optional)
    -  **seeders** - database seeders folder
    -  `index.js` - Application entry point
- **test** [dir]
    - feature [dir]
    - unit [dir]
    - `test.js` 

Out of the box structure for building Node Express APIs, comes preconfigured with the following;
###Dependencies
* **body-parser** - Node.js body parsing middleware.
Parse incoming request bodies in a middleware before your handlers, available under the req.body property. [body-parser](https://github.com/expressjs/body-parser)
* **express** - Fast, unopinionated, minimalist web framework for node. [express-framework](https://github.com/expressjs/express)
* **morgan** - HTTP request logger middleware for node.js. [morgan](https://github.com/expressjs/morgan)
* **sequelize** - Sequelize is a promise-based Node.js ORM for Postgres, MySQL, SQLite and Microsoft SQL Server. It features solid transaction support, relations, read replication and more. [sequelize](http://docs.sequelizejs.com/)

#### Test framework
* **Mocha** - Mocha is a feature-rich JavaScript test framework running on Node.js and in the browser, making asynchronous testing simple and fun. [mochajs](https://mochajs.org/)
* **Chai** - Chai is a BDD / TDD assertion library for node and the browser that can be delightfully paired with any javascript testing framework. [chai](http://www.chaijs.com/)
* **chai-http** - HTTP integration testing with Chai assertions.[chai-http](http://www.chaijs.com/plugins/chai-http/)

### Licence
*     MIT
