# One More Page

### Young adult books are for the young and the forever young-at-heart. At One More Page we love YA books just as much as you, possibly even more. What can we say? We’re a little obsessed. The One More Page community is where you can find the hottest YA books and meet new friends who share your reading interests. Here’s to late nights reading, telling yourself ... _just one more page_.

One More Page is a social book club application that allows users to connect with fellow YA devotees. Members can follow current book clubs, create new topics and create new posts and comment on other members posts. Users can also view upcoming and past book clubs.

## [Demo Site](https://onemorepage.herokuapp.com/)

## Project Objectives

- As a user, I want to know the name and purpose of this site so that I can decide whether I want to join.
- As a user, I want to sign-up for a free account by providing an email, username and password so I can access the public book clubs
- As a user, I want to sign-in and out of One More Page.
- As a user, I want to see the current & upcoming book clubs so I can join clubs that appeal to me.
- As a user, I also want to see the past book clubs so I can see previous discussions.
- As a user, I want to join a book club to post and comment in the book club so I can discuss the current book and engage in with the One More Page community.
- As a user, I want to edit and delete posts and comments I created because sometimes we change our minds.
- As a developer, I want “book clubs” to be set by indivdual books.
- As a developer, I want discussion sections to be separated into a general topic area and a progress-specific areas so members have a space to discuss specific parts of the book where they can talk with members in the same section of the book and live free from the fear of spoilers.
- As a developer, I want to close the book’s discussion to posts, comments, topic additions after a book is completed to facilitate a monthly schedule and keep conversations current.
- As a developer, I want to offer two different user roles: standard member & site admin in order to provide different levels of access and rights.
- As a developer, I want the book’s cover art to be displayed to make the site more visually appealing.

## Future Features

- As a developer, I want to offer two types of book clubs: public (set by site) and private (user generated) in order to build a community and generate paying customers.
- As a premium member, I want to create private book clubs so I can choose my book and set up a group with premium members of my choosing.
- As a premium member, in private book clubs I create (making them the moderator for that private book club), I want to add and remove club members and other moderators.
- As an entrepreneur, I want to include a link to buy the book to create an additional revenue source.

## Built With

#### Languages and Frameworks:
- Ruby 2.5.0
- Rails 5.1.4
- Bootstrap 4.0.0

#### Databases:
- SQLite (Test, Development)
- PostgreSQL (Production)

#### Tools and Gems:
- Devise for user authentication
- SendGrid for email confirmation
- Pundit for authorizations
- Paperclip for file uploading
- AWS S3 for image file storage (production only)
- RPEC for test driven developement
- FactoryBot for test suite success
- Fakker for generating test data

## Setup and Configuration

#### Setup:

- Environment variables were set using Figaro and are stored in config/application.yml (ignored by git).

- The config/application.example.yml file illustrates how environment variables should be stored.

#### To run One More Page locally:

1. Clone the repository
2. Run `bundle install`
3. Create and migrate the database with `rails db:create` and `rails db:migrate`
4. Start the server using `rails server`
5. Run the app on `localhost:3000`
