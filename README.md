# Album-Review
Ruby on Rails Album Review App

## Set-up:
- go into desired directory via the terminal
 - git clone repo followed by:
 - "rails new Album Review"
  - it will fetch all the files that create the starting structure for any rails application.
- Cd into the directory.

## Models and Attributes:
- we will need to create a rails model to represent each book:
- they are essentially objects.

- our albums will have the following Attributes:
 - a title
 - a description
 - an artist

## "In the command line":

- This is the structure of creating a model in the terminal: rails generate modelName attribute:type
- "rails generate model Album title:string description:text author:string"

- The above command will do the following:
 - create files: model file, migration file.
 - look in our db/migrate directory
 - when you create a model(album) it will correspond to a table in the database which will be plural(albums.
 - look in app-directory: which will be where most of our code will live
 - app/models: filling that in with associations
 - When you create a new model or migration, a new migration is added to the db/migrate directory.

 - Rake db:migrate is a command that checks the missing migrations that need to be applied to the database and applies them to the DB, which ultimately updates it.

-In the command line:
 - "rake db:migrate"

## Start a new server:

- in the same directory where all our work lives:
- in command line: "rails s"
- it creates a development viewing environment.
 - in browser go to localhost:3000 to see if rails server launch is successful.

## Controllers in ruby on rails:
