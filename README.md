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

## Command line:

- This is the structure of creating a model in the terminal:  
    - rails generate modelName attribute:type
- In the case of this application:
    - "rails generate model Album title:string description:text author:string"

- The above command will do the following:
    - create files: model file, migration file.
    - look in our db/migrate directory
- when you create a model(album) it will correspond to a table in the database which will be plural(albums).

  - look in app-directory: which will be where most of our code will live
    - app/models: filling that in with associations
    - When you create a new model or migration, a new migration is added to the db/migrate directory.

 - Rake db:migrate is a command that checks the missing migrations that need to be applied to the database and applies them to the DB, which ultimately updates it.

- In the command line:
  - "rake db:migrate"

## Start a new server:

- in the same directory where all our work lives:
- in command line: "rails s"
- it creates a development viewing environment.
 - in browser go to localhost:3000 to see if rails server launch is successful.

## Controllers in ruby on rails:

- House for all the actions, new create, edit, update, delete..
- Actions will correspond to the views
-"rails generate controller Albums" controller names are plural
- it will create our controller file, test files, view templates for albums.

## Define Routes:

- Routes correspond to the urls we visit.
- type in rake routes in terminal to see which routes we have
- we will create a restful route:
  - a single line command that generates all the corresponding url we need for a specific controller.
- in the routes.rb file, type in the following after do: resources:albums.
  - instead of declaring seperate routes for our index, show, edit, delete , new , update actions, a resourceful route declares them in a single line: resources:albums
- then run in the terminal: "rake Routes"
  - this will create our restful routes, and root path which will display all of our albums.

- next, in the routes.rb file, we should define our root path and make it correspond to albums#index action. Below line 2 input the following:
    - root 'albums#index'
    - then run rake routes in the terminal.

## Define the index actions

- go into the 'albums_controller.rb' file in the controllers directory and quickly fill out the index action.
