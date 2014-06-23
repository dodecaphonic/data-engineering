# Paganza (solution to "LS: Challenge for Software Engineer - Big Data")

## Setup

This project requires Ruby 2.x. The only external dependencies are sqlite3 (for the database) and phantomjs (for feature tests).

### Debian-based Linux

    $ apt-get install libsqlite3-dev phantomjs

### MacOS X

MacOS X already provides a version of SQLite3 you can compile against. If you wish to use a newer version using [Homebrew][homebrew].

    $ brew install sqlite3

Installing phantomjs:

    $ brew install phantomjs
    
## Running

### Application

After cloning the repository and changing to its directory, you must run Bundler:

     $ bundle install

When it finishes, load the schema and the seeds:

     $ bundle exec rake db:setup

Start Puma up:

     $ bundle exec rails s

And go to the login page at http://localhost:3000. There's a default user *admin@paganza.com* with a password *paganza123*. You can use it to sign in.

### Tests

Tests can be run with:

     $ bundle exec rake spec

After the run, a coverage file will be generated as `coverage/index.html`.

## Sample files

There are two sample files to test if the import is working correctly, located at `spec/resources`: `botched_input.tab` is a file with invalid input; `example_input.tab` is the file provided by LivingSocial.

[homebrew]: http://brew.sh
