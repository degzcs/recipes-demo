# Recipes Demo

This app shows recipes from Contentful API

## Install

#### Prerequisites

Create an account in Contentful and then Create the API keys.

Then copy this file:

```
$ cp config/application.yml.example config/application.yml
```

and add the the space id and the access token.

Go to the project and execute the next command:

```
$ bundle install
```

## Run Demo

```
$ rackup -I config.ru
```

## Run Tests

```
rspec spec
```
## Contributos
- Diego Gomez
