# Grape API Example
Sample API application using Grape, Grape Swagger, and Grape Entity

#### Prerequisite 

This sample used Redis as its datastore. The easiest way to install it is to use homebrew
```
$ brew install redis
```
Start Redis
```
$ redis
```


#### Running the Example

```
$ git clone https://github.com/tbeauvais/sales_api.git

$ cd sales_api

$ bundle

$ bundle exec puma

```


## Testing in Swagger UI

Open http://petstore.swagger.io/ in your browser. Point the Swagger UI to your local running server.

```
http://localhost:9292/swagger_doc
```

![Application Architecture](/doc/swagger_ui.png)

From here you can start by adding some sample data using the POST operation. Once you have some sales records you can view then using the GET operation.
![Application Architecture](/doc/swagger_post.png)

