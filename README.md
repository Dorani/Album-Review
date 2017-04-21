# Album-Review
Ruby on Rails Album Review App

## Set-up:
- go into desired directory via the terminal
  - git clone repo followed by:
  - "rails new Album Review"
  - it will fetch all the files that create the starting structure for any rails application.
- Cd into the directory.

## Models and Attributes:
- we will need to create a rails model to represent each album:
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
    - "rails generate controller Albums" controller names are plural

- it will create our controller file, test files, view templates for albums.

## Define Routes:

- Routes correspond to the urls we visit
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
    - then redirect to the root path:
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
        - edit album and render form again.
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
      + within the body:
          - create a nav tag with a class of navbar-default
          - create a div with a class of container: not ensure edges are not processing
          - create a div with navbar header with a link to the root path
          - rails can add html classes into ruby code, which is really cool.
      + add our links:
          - unordered list: navbar-nav
          - list item: sign up link and the path that corresponds is:
          - new_user_registration_path
      + if a user signed in, he/she should not see a sign in link, they will see logout
          - conditional statement:
          - if user signed in: link_to sign out tag: destroy user session with a method of delete
          - else statement, if a user is not signed in, with a link_ to login: new user session path.
      + let's move the create album link into the nav bar:
          - new ul so that it has its own area floated to the right:
          - same styling as navbar-nav
          - same conditional, you have to have an account to post a new album.

## Associations:

  - Next step here, is making sure that a created album is associated with a spefiic user after sign up.
  - go into rails console
      - album
      - we need to generate a migration:
          - a way of updating the database without creating a new table/model
          - rails generate migration add_user_id_to_albums user_id:integer
          - then we get a migration file:
          - changing/adding user id to album table
          - rake db:migrate
- go back into rails console, an album has a user id
    - albums controller:
    - we need to update new and create action
    - current user is being built out from the current user
    - same for create, but create is going to be taking album params

- Adding associations: which is associating one model with another

- Go into the album model first: models/album:
    - an album belongs to a user
- Go into user model:
    - user has many albums

## Accessing the database
  - rails c:
      - album.connection: establish connection to that specific database
      - access specific albums: "@album = Album.last"
      - changin a posted album to a specifc user_id then saving:
          - @album.user_id = 1
          - @album.save

## Privacy:
  - We dont want a user that did not create an album able to edit or delete that album
      - conditional in album show page
      - if statement that checks if the album.user_id is equivalent to the current user id
      - we want the links to appear
      - if not they wont.
  - another if statement:
      - if a user is signed in:
      - check if a user is signed in:
      - to be able to call methods and atr on specific albums.

## New Category Model:

- We want to be able to filter by category type or genre in regards to the albums
    - 1 thing, we want to go into our terminal and type:
    - rails generate model Genre/Category name:string

- We have the create genre/category table and model:
 check it out in the migration files

- next we need to update our database:
    - rake db:migrate

- Next, we want to associate an album with a genre/category id
    - rails generate migration add_category_id_to_albums category_id:integer
    - After you run that migration we need to:
        - run rake db:migrate to update our database
        - check out migration file

## Rails console
  - Make sure category_id is part of our album model
  - rails c:
      - album.connection
      - album:
          + you should see that category_id is part of our album model!
## Selecting Categories:
  - We now need a way to select a category when an album is created
  - album controller:
      - add a way to access categories when we create a new album:
      - in the "new" action @categories = Category.all.map{|c| [c.name, c.id]}
      - then go into our new.html:
          - add a way to select a category:
          - select tag, and select category id, and set options will select all the categories we will have
          - rap, rock, techno
          - :prompt = select a category
          - check it out now
  - associate an album with a category id:
      - in the create action we @album.category_id = params[:category_id]
      - set @album category_id attribute to the category id that its passed in when we submit the form
  - we need to add categories so we will need to go in our console
      - rails console
      - Category.connection
      - Category.create(name: "Rap")
      - Category.create(name: "Rock")
      - Category.create(name: "Techno")
      - Category.all to see all the created and saved categories
  - now go back into add album
  - see if categories are rendered
  - Last thing we need to do is update the album params to also permit category_id or it will not SET category_id
  - in our private methods add category_id to the require params for album.
  - let's add category in the show page:
      - show.html
      - @album.category.name add as an h4
- We now just need to add the same thing we added to the new action, maping of categories to the new and edit action.
- And for update, we pass in what we passed into create.

## Edit action
- we want to make sure a category is filled in when we hit on edit form:
     - copy form partial and add it into our edit view
     - change the select type: category_id and @categories
     - add the multipart
     - that will fill in the category select when we edit

## Dropdown for Categories:
  - application layout files
  - add Dropdown
      - li class of dropdown
      - ancher with class of dropdown toggle
      - these are all bootstrap classes by the way
      - role of botton
      - categories:
           - span class of caret with our list of categories which will be an ul.
      - loop through, for each, category and list them
      - link_to category.name and go to the album path, index page.
      - pass the name of the category to url as params, then filter it out

## Controllers

  - go into albums Controllers
  - in the index action
       -  add a conditional:
       - if the category params that we passed were blank then we want to display all the albums cause we are not filtering
       - else, if we pass params in, we will display those specific albums
       - finding the name that is being past into the params, getting the id that we are passing in when we hit the dropdown
       - we will display the album where the category_id = the category_id attribute and order it by createat dec.
  - end the if conditional
  - we just want to be able to know so lets make some edits to our index:
      - line1
  - all set!

## New Gems!

  - we want to be able to render just the pictures of the albums on our index
  - visit: www.rubygems.org and type in "paperclip"
      - gemfile
      - gem 'paperclip', '~> 5.1'
      - bundle install so our app knows to use the paperclip gem
      - now let's visit the documentation
      - we need an image processor:
          - homebrew can do it for us:
          - brew install imagemagick
          - in the terminal type in: "which convert"
          - output: /usr/local/bin/convert
          - config environment and paste inPaperclip.options[:command_path] = "/usr/local/bin/"
          - helps paperclip know where to look for the imagemagick
          - back to the docus and copy the quick start/model
          - paste in our album.rb file below the associations and what it does is the following:
              - defining the attached file
              - we want to use album img instead of avatar
              - the rest is styles in terms of sizing of images
              - rename album_index and adjust px
    - Now, we want to look at migrations:
        - add attachment
        - and remove
        - rails generate paperclip Album album_img:
        - album_img corresponds to the name of the attached file we added in our album.rb
        - now let's update our database with rake db:migrate

## Uploading Pics functionality:

  - file filed below category
  - browze and Uploading
  - go into the form partial
  - below the category id we will add a file field tag, and it will get the album img
  - then add the same thing to the edit file
  - now in the a;bum controller go into the album params and permit the album img as well
  - now we should be able to add an img to an album.

## Views

  - the next major thing here is we want to be able to see the img of the album and click on it to be redirected to the show page.
      - go into our index file, which is where we display our titles
      - instead of linking to the album titles
      - we will create an anchor tag which will link to the show page url for an album /album/id
      - that instance of album show page
      - then an image tag
          - album.album_img.url(:album_index).

## Styling and layout

  - go into our index view
      - wrap the list of albums in a div class of row
      - wrap each album in a col-md-3
      - 4 albums each side by side rendered

  - now go into our application.html file:
      - wrap all the content in a div of a class of container
      - centers content a lot nicer
      - you should see some margin on right and left

  - now, if you feel like your image sizing is off on the index, do the following:
      - , class:"album" at the end of your image tag
      - then app.css.scss:
          - .album height and width.

  - now, we just need to display the album cover in the appropriate show.html file
      - render it up top with the image tag and a class of "album-show"
      - add styling to scss file for that specific class

  - more adjusting to the show page:
      - show page:
      - wrap content in a div

## Reviews!

    - creating a review model;
        - terminal:
        - rails generate model Rreview rating:integer comment:text
        - give a review and a comment!
        - then we run rake db migrate to update our db
        - check out the migration file in the db directory
        - model directory, reviews.rb represents our reviews model

    - now, what we want to do is add a user_id to reviews, we want create the associations
        - rails generate migration add_user_id_to_reviews user_id:integer
        - what this does is generates a migration which updates our database and adding a user_id to reviews and user_id is an integer
        - then rake db:migrate
        - check out migration file/ adding user_id to reviews

    - now, we want to add album_id to reviews, so an album can have many reviews and a review is associated with that specific album:
        - rails generate migration add_album_id_to_reviews album_id:integer
        - rake db:migrate

## Associations between models

    -
