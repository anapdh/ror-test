# README

This application is a test for the Elysios company.

## Dependencies

To run this app you'll need:

* Ruby version: 2.7.5
* Rails version: 5.2.8.1
* MySQL version: 12

## Setup

In your terminal, run the following commands to setup the project:

1. Install the gems: `bundle install`

2. Database configuration: `rails db:create db:migrate db:seed`

- To create and migrate the database, you'll need to access the file config/database.yml and provide the `username` and `password` used in your MySQL12.

Now your environment is ready to run the project! Type `rails s`, open your browser and type `localhost:3000`.

3. Run the tests: `rspec`

## About the project:

The project contains the requisites given in the [code_challenge_ror](https://github.com/Elysios/code_challenge_ror).

There are two types of users, guest and Admin. Only an Admin can create, edit and delete Commercial Contacts and add, edit or delete properties to them. Guests can only see Commercial Contacts and their details.

The seeds will provide the referred users, in order to access them you can use generated logins:
* Admin: `email: admin@example.com, password: password`
* Guest: `email: guest@example.com, password: password`

You can create new users, but any new user will also be a guest. So it's important to use the Admin user to explore the project's features.

Seeds will also provide two Commercial Contacts as examples, a Client and a Provider. The generated Provider will contain 3 properties, which you can edit or delete. Feel free to edit the properties from the generated Provider, or, you can always create a new Client or Provider, and in the last case, add/edit/delete its properties.
Any newly generated property will use the field 'Plant Specie' to add its name to a new table(plants). So plant species will belong to both Property and Plant models.

#### Additional Info:

Here's a list of features I would implement if I had more time:

  - Better usage of User roles for Admin/guest to work with User permissions;
  - Measure units for centimeters and meters for plants area/rows/columns, and a mask for having a better input on the form;
  - Generate a new text input for Plant Specie dropdown when 'Other' is selected to add a new specie that is not on the list;
  - General Bootstrap styles.

## Author

👩🏼‍💻 **Ana Paula Hübner**

- GitHub: [@anapdh](https://github.com/anapdh)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/anapdh)