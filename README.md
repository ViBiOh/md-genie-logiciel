# md-genie-logiciel

[![Build Status](https://travis-ci.org/ViBiOh/genie-logiciel.svg?branch=master)](https://travis-ci.org/ViBiOh/genie-logiciel)

## Thanks

[Twitter Emoji](https://github.com/twitter/twemoji) for favicon.

## Course

### Install

You need npm in order to build `/dist` directory and Docker if you want to run inside a light HTTP Server.

```bash
npm run build
docker build -t vibioh/genie-logiciel .
```

### Run

```bash
docker run -d vibioh/genie-logiciel
```

```bash
go get -u github.com/ViBiOh/viws
npm start
```

Browse [LocalHost](http://localhost:1080)

## Java sample

```bash
mvn clean install
```
