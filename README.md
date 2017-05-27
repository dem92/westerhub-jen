# README

[![Build Status](https://travis-ci.com/dem92/westerhub-jen.svg?token=XBxNCWhRe4J4qpFpzXXD&branch=master)](https://travis-ci.com/dem92/westerhub-jen)

#### Repositories
* Git: https://github.com/dem92/westerhub-jen
* Heroku: https://westerhub.herokuapp.com/

## How to run the application
#### 1 way (default)
```bash
bundle install
rake db:setup 
rails s
```
Open browser on `localhost:3000`
#### 2 way (docker)
1. In file `~/config/database.yml`
change (uncomment) this lines
```yml
development:
  <<: *default
# username, password, host - settings for container
#  username: postgres
#  password:
#  host: db
  database: westerhub_development  
  
  ...
  
test:
  <<: *default
#  username: postgres
#  password:
#  host: db
  database: westerhub_test
```
to 
```yml
development:
  <<: *default
# username, password, host - settings for container
  username: postgres
  password:
  host: db
  database: westerhub_development
  
  ...
  
test:
  <<: *default
  username: postgres
  password:
  host: db
  database: westerhub_test
```
2. Open terminal in application root folder and
build docker container
```bash
docker-compose build
```
3. Run application
```bash
docker-compose up
```
4. Open `new terminal` in application root folder and run
```bash
docker-compose run web rake db:setup
```

##### !!! NB how to properly stop server 
Strongly recommend to use
```bash
docker-compose stop
```
to avoid 
<a href="https://stackoverflow.com/questions/24627701/a-server-is-already-running-check-tmp-pids-server-pid-exiting-rails">pids</a> problem.
This problem has also been mentioned in 
<a href="https://docs.docker.com/compose/rails/#restart-the-application">docker get started</a>. 

## How to run tests
#### 1 way (default)
* Test
```bash
rake test
```
* Generate test coverage report
```bash
COVERAGE=true rake test
```
#### 2 way (docker)
inside container's bash run same commands as 1 way (default)
#### ! NB
* Test
```bash
   docker-compose run web bash -c 'rake test'
```
* Generate test coverage report
```bash
   docker-compose run web bash -c 'COVERAGE=true rake test'
```


#### Description
We wanted to create a web application for Westedals students.
Our goal was to create a platform for posting jobs and collaborative project opportunities.
We also wished to facilitate communication between students, and also between companies and students.

The navigation bar on the top and the footer is on every page on the site.
From the navbar a user can return to the landing page, and go to Projects, Collaborators, or Companies.
If the user is not signed in they can also sign up, or log in.
If the user is signed in the user can also go to their profile or log out.

The footer contains contact information, and Google Maps is implemented to show the school.

On the landing page the user is introduced to the concept of the page.
Further down some of the collaborators will be highlighted.

On the Projects page a user can see a summary of all projects registered on the site.
The page is paginated, and the projects are ordered from newest to oldest.
Each project has a "Show" button, when clicked it will send the user to the page of the corresponding project.
On the left side of the page there is a button for creating a new project.
The user is also able to sort the projects by tags, or search for projects by title.

The page for a specific project shows all information about the project.
If the user clicks on the picture, a bigger version of the picture is shown.
If the user is the publisher of the project they are also able to edit or delete the project.
On the bottom of the page a user is able to see previously published comments, and leave comments if logged in.
On the left side there is a short summary of the profile of the publisher of the project.

On the pages for creating or updating a project there is a form the user can fill out.
The input is validated when the user submits the form.

On the Collaborators page the user can see the collaborators registered on the site.
The functionality works the same way as the corresponding functionality in the project pages.

On a profile page the user can see all information registered on a collaborator.
If it is the user's own page there are options to edit and destroy the profile.
"Edit" will send the user to an input form. The form is validated, and a user is asked to confirm changes with their password.
If the user deletes their profile, their projects are deleted as well.

The Companies page is not implemented, but would work the same way as the page for Collaborators.

If the user tries to do something that requires a registered account they are redirected to the login page.




##### User flow:

Any user can:
* Register a new user
* View all profiles, projects and comments
* Users are redirected when attempting to access restricted functionality

A Westerhub user can:
* Log in
* Publish/delete own comments
* Publish/edit/delete own projects
* Edit/delete own user profile

##### Summary of functionality:

* Search function with sorting on projects and collaborators
* Pagination feature
* Model validation
* Image uploading feature
* Implementation of Google Maps
* Registration/login feature

#### Team contributions
Each team member participated in:
* Planning
* Development of project concept
* Project specification
* Pair programming
* Code review
* Bug hunting
* Documentation
* Design

#### Individual contributions

##### Eva Dahlø (Github: <a href="https://github.com/dem92">dem92</a>)
Eva worked with designing the pages for projects.
She implemented AJAX, and the functionality for sorting and searching the projects in addition to pagination, 
and worked with the image uploader, to save a big and a small version of the images.
She contributed to the design of the navbar, and created the 404 page.
She added validation for the comments and projects models, and made model tests for the comments.

##### Joakim Jacobsen (Github: <a href="https://github.com/JoakimEJ">JoakimEJ</a>)
Joakim's main focus throughout the project was to manage the Devise gem in order to have authentication
for users. It was his job to make sure that unauthorised users did not have access to locations where this
was needed, and also to ensure that only the owners themselves were able to delete or update 
projects/profiles/comments. He also set up the landingpage, the collaboration page, profiles for users, 
comments on projects and the footer. Validation on user input for signing up and logging in was also 
his responsibility.

##### Nikita Zhevnitskiy (Github: <a href="https://github.com/NikitaZhevnitskiy">NikitaZhevnitskiy</a>)
Nikita worked with tests. He was responsible for continuous integration & writing tests: unit, integration, controllers and test coverage report. 
He administrated docker images, setup docker and travis configuration. 
He alse took responsibility for deployments. 
