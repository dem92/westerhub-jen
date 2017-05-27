# README

[![Build Status](https://travis-ci.com/dem92/westerhub-jen.svg?token=XBxNCWhRe4J4qpFpzXXD&branch=master)](https://travis-ci.com/dem92/westerhub-jen)

#### Repositories
// -- Remember to give Andrea read access
* Git: https://github.com/dem92/westerhub-jen
* Heroku:

#### Log in 
// -- If needed. Can also be sent by e-mail if we don't want it in the readme.

#### How to run the application

#### How to run the tests

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

#### Individual contributions

##### Eva Dahlø (dem92)
Eva worked with designing the pages for projects.
She implemented AJAX, and the functionality for sorting and searching the projects, 
and worked with the image uploader, to save a big and a small version of the images.
She contributed to the design of the navbar, and created the 404 page.
She added validation for the comments and projects models, and made model tests for the comments.

She participated in group planning and discussions, and with developing the concept of the project.

##### Joakim Jacobsen (JoakimEJ)

##### Nikita Zhevnitskiy ( NikitaZhevnitskiy)

#### Other relevant information, especially functionalities/libraries not discussed in class


// -- Points below this line were included in the template, might not need to be included
#### Ruby version

#### System dependencies

#### Configuration

#### Database creation

#### Database initialization

#### Services (job queues, cache servers, search engines, etc.)

#### Deployment instructions
