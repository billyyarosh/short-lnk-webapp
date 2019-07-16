# README

## Quick Start
Assuming Rails 5.2.3, and Ruby 2.3.8 are installed on your system.

**Quick Run**
```
$ git clone git@github.com:keaplogik/short-lnk-webapp.git
$ cd short-lnk-webapp
$ bin/rake rake db:setup
$ bin/rails server
```

**Smoke Test**
- Step through Quick Run
- Navigate to localhost:3000
- Enter a public link to shorten (ex: https://stackoverflow.com/users/1387421/keaplogik)
- Press the Create button
- Navigate to the URL provided in the user interface.
- See that you were redirected to the actual link.


## Project Information
* Rails version
    - 5.2.3

* Ruby version
    - 2.3.8

* System dependencies
    - SQLite3 in memory database

* Configuration
    - TODO

* Database creation
    - `bin/rake db:create`
    - `bin/rake db:migrate`

* Database initialization
    - `bin/rake db:seed`

* How to run the test suite
    - `bin/rake test`

* Services (job queues, cache servers, search engines, etc.)
    - NA No current services. 

* Deployment instructions
    - `bin/rails server` (Currently only runs locally)
