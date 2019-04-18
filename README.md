#README
# MyCV


## Getting Started
### Ruby version
  Installing ruby-2.6 via [Ruby Version Manager (RVM)](https://rvm.io/) is recommended.

### System dependencies
  - postgresql
  - postgresql-9.4
  - libpq-dev
  - ruby-2.6

### Ruby gems
  - sassc-rails
  - pg
  - bundle
  - rails
  - json
  - figaro
  - sitemap_generator

### Configuration

### Database
  - PostgreSQL
  - To prevent any compatible issues, PostgreSQL version 9.4 is recommended.

## Running Sequence
### Database initialization
  - Initial database with psql command:
  ```
  $sudo -u postgres psql <project path>/MyCV.sql
  ```
  - Create application.yml in <project folder>/config with this form:
  ```
  # Add configuration values here, as shown below.
  #
  # pusher_app_id: "2954"
  # pusher_key: 7381a978f7dd7f9a1117
  # pusher_secret: abdc3b896a0ffb85d373
  # stripe_api_key: sk_test_2J0l093xOyW72XUYJHE4Dv2r
  # stripe_publishable_key: pk_test_ro9jV5SNwGb1yYlQfzG17LHK
  #
  # production:
  #   stripe_api_key: sk_live_EeHnL644i6zo4Iyq4v1KdV9H
  #   stripe_publishable_key: pk_live_9lcthxpSIHbGwmdO941O1XVU

  DB_ADAPTER:               'postgresql'
  # Environment variables for database connection
  DB_HOST:                  'localhost'
  DB_PORT:                  '5432'
  DB_NAME:                  'mycv'
  DB_USERNAME:              ''
  DB_PASSWORD:              ''
  DB_TIMEOUT:               ''

  # Environment variables for mailler
  GMAIL_PORT:               ''
  GMAIL_USER_NAME:          ''
  GMAIL_PASSWORD:           ''

  # Environment variables for Home controller
  NAME_HOME:                ''
  INTRO_HOME:               ''
  QUOTE_HOME:               ''
  QUOTE_OWNER_HOME:         ''
  ```
  - Create Google App Password before fill out the mailler section

### Services
  Start PostgreSQL service before run the whole project.

### Deployment instructions
  - Make sure PostgreSQL service and Database was Initialed.
  - Go to the project folder
  - Open terminal and run
  ```
  $bundle install
  $rake db:migrate
  $rails server
  ```

## Authors
  - **Nguyen Ly Quan** - *Develop* - [chota5511](https://github.com/chota5511/)

  See also the list of [contributors](https://github.com/chota5511/MyCV/graphs/contributors) who participated in this project.
