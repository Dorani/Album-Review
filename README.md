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
  - an author (artist)

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
     - now when we access our root path, it will say our template is missing.
     - when we visited the new route, it said we were missing an action, but now our action is define so all we need to do is wire it to a template:

- in our views/albums directory, create a file called index.html.erb, fill in some place text and let's test it out.

## Gems!

- gems will live in our gem file:
    - they are essentially, libraries of functionality that we can add to our application.
    - we will be using 'simple form' and 'bootstrap sass'.
    - visit: www.rubygems.org and type in the gems we will be using and copy the gem/file link.
    - paste it in our gem file/link.

- Simple form provides an easy structure for the user to fill out information.
- Bootstrap sass is the bootstrap framework from twitter but its ported from its native processing language which is less and its ported to sass.

    - now to let our application know we want to use those gems. We need to go into our terminal:
        - "bundle install"
        - then check the homepage link for simple form: https://github.com/plataformatec/simple_form
        - there will be instructions on running the generator.
        - the generator will allow us to use simple form. In our case we are using bootstrap so let's use this:
            - "rails generate simple_form:install --bootstrap".

        - Import Bootstrap styles in app/assets/stylesheets/application.scss:

        - "bootstrap-sprockets" must be imported before "bootstrap" and "bootstrap/variables"
        @import "bootstrap-sprockets";
        @import "bootstrap";
        bootstrap-sprockets must be imported before bootstrap for the icon fonts to work.

        - add "//= require bootstrap-sprockets" in the javascript/application.js

    - Now, if we run rails s, we should see a drastic difference with the styling!


## New actions:

- def new and create!
    - new: @album notes an instance var which is what we use in our views.
    - create will be same as album, but will accept album params.
    - Album params is when a user, fills in info and send request, it will passed with the user info in a form.
        - require name of our model, title, description and artist.
        - also, album_params gets defined in a private method.

## New template:

- now that we have our actions defined, lets create some templates to wire them to:
    - views/albums/ and create new.html.erb
    - add some content, then run rails, and go to the following route to test: localhost:3000/albums/new
    - you should see our quickly added content for test.

## Partials, views.

- next, we will be creating our form in this new.html.

- However, we will not create the form in the new file, we will create a form partial.
    - it will house our form, so we can reference it in specific views.
        - to denote a partial: use an _ directly before the file name: form.html.erb,
        - we will rendering the form in the new view, so we will be using the instance var @album.
        - see simple form documentation: https://github.com/plataformatec/simple_form
  - Now, once we have our form partial complete, we will need to render it in our new.html.erb file using the script <%= render 'form' %>.

## Actions

- go back to our create action in our controller:
    - add conditional statement, in the event that an album is created.
    - redirect to the root path:
        - index
    - if not saved, we will render a new form.
    - album created, to check that we can go into our rails console by typing rails c:
        - Album.connection
        - @album = Album.first:
            - we should see all the details on our 1st album created.

## Displaying albums on index

- in our index action:
    - define an instance variable (@albums)
    - and associate with @albums.all
    - order it by created_at Attribute
- the go to the corresponding view template
    - loop through the albums
    - then display them.
    - create a link at the bottom to our create_new album path.

## New action

- now, we will define a new action called show:
    - to show an album we will first need to find the album by params_id
    - we will be finding the album in our show action, and in other types of actions as well such as update, edit and destroy functionality
    - so to make code more dry, we should refactor the code and define a method called find_album in our private method area.
    - define a before_action, to find our album, and only find album for specific actions.
    - create a show file in the views.
    - in this application, we will be creating our actions and then the corresponding view files always.
    - in the show.html.erb render what we want.
    - in our index to easily access the specific album details, we will create a link to the show path per specific album.

## Edit/Update and Destroy Albums:
  - define them in the controller
      - in our edit action, we have @album available.
      - update: we will check if album is update successfully
          - with a form: when they update the form they will be updating the album params_id
          - redirect when complete
          - else we render a new form for our update functionality
      - then we should create our edit view:
          - edit book and render form again.
          - it will auto pre populated form with old content then we can edit and update!
      - then we can add links to edit and delete:
          - go to show page
              - add a couple link to paths, edit: edit_album_path(album)
              - delete link, album_path(@album), method: :delete, and we will do a data confirm: "are you sure?".
      - destroy functionality:
              - get the album which we already have, then destroy it, redirect to root path cause show page does not exist cause its gone!
  - Now we should have an entire CRUD established.

## Next Steps:
  - Adding users to our apps:
      - using devise
  - Add categories for our nav bar to filter albums based on rap, rock, techno.

## New Gems:
  - www.rubygems.org:
      - devise:
          - user auth gem that allows users to sign and out into our application
          - take the gemfile copy it to our gem files
          - run bundle install
      - rails generate devise:install
          - install to our application
      - now go to our layout file:
          - yield tag: paste in alert and notice tabs. for signing in and out.
      - rails generate devise:views
          - style app with bootstrap
          - so you should see devise views now.
      - rails generate devise user
          - creates our user model and table
          - then we run rake db:migrate which will update our app
          - restart server
          - devise will create our routes for sign in out/up and out.
          - check rake routes!

## Adding nav bar:
- we will be adding it to the application.html.erb file in the layouts directory because this is common across every view in our navigation
  - use bootstrap/components/nav bar/ choose one.
  - go into the application html file:
      - within the body:
          - create a nav tag with a class of navbar-default
          - create a div with a class of container: not ensure edges are not processing
          - create a div with navbar header with a link to the root path
          - rails can add html classes into ruby code, which is really cool.
      - add our links:
          - unordered list: navbar-nav
          - list item: sign up link and the path that corresponds is:
                - new_user_registration_path
      - if a user signed in, he/she should not see a sign in link, they will see logout
          - if statement:
              - if user signed in: link_to sign out tag: destroy user session with a method of delete
              - else statement, if a user is not signed in, with a link_ to login: new user session path.
      - let's move the create album link into the nav bar:
          - new ul so that it has its own area floated to the right:
          - same styling as navbar-nav
          - same conditional, you have to have an account to post a new album.
