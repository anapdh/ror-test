# README

This application is a test for the Elysios company.

## Dependencies

You'll need:

* Ruby version: 2.7.5
* Rails version: 5.2.8.1
* MySQL version: 12

## Setup


1. Install the gems: `bundle install`

2. Database configuration: `rails db:create db:migrate db:seed`

In order to create and migrate the database, you'll need to access the file config/database.yml and provide the username and password used in your MySQL12.

Now your environment is ready to run the project! Type `rails s`, open your browser and type `localhost:3000`.

3. Run the tests: `rspec`

## About the project:

The project contains the requisites given in the [code_challenge_ror](https://github.com/Elysios/code_challenge_ror).

There are two types of users, guest and Admin. Only an Admin can create, edit and delete Commercial Contacts and add, edit or delete properties to them. Guests can only see Commercial Contacts details.

The seed will provide the users, in order to access you can use:
* Admin: `email: admin@example.com, password: password`
* Guest: `email: guest@example.com, password: password`

Any new user will also be a guest. So it's important use the Admin user to explore the project's features.

## Author

👩🏼‍💻 **Ana Paula Hübner**

- GitHub: [@anapdh](https://github.com/anapdh)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/anapdh)