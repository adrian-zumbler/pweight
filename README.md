# PWeight

It is an application that checks directly in the services of Fedex the information of the tracking of a package and calculates if there is an overweight.

Things you may want to cover:

* Ruby version
    - ruby:2.5

* System dependencies
     - Docker
     - Rails 5
     - Postgres

* Configuration
```
docker-compose build
docker-compose up
```

* Database creation

Inside container run the next commands. To run commands inside a container execute the next line

```
docker exec -it skydropmx_web_1 bash
```

```
rake db:create
rake db:migrate
```

* Database initialization
```
rake db:seed
```

* How to run the test suite
```
bundle exec rspec spec/models
```

* Services (job queues, cache servers, search engines, etc.)

* Test
    -  Go to http://localhost:3000/packages to see the report

## happy coding
