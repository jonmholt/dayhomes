# Dayhomes

## The Team

 * *Mark Bennett* - project management, [mark@burmis.ca](mailto:mark@burmis.ca), 780 826 6275, [@MarkBennett on Twitter](https://twitter.com/MarkBennett), [Google+](https://plus.google.com/104431949275766772757/posts), [MarkBennett on GitHub](https://github.com/MarkBennett)
 * *Nathan Bertram* - development, [nbertram@gmail.com](mailto:nbertram@gmail.com), [@nathanbertram on Twitter](https://twitter.com/nathanbertram), [Google+](https://plus.google.com/118053740037238335612/posts), [GitHub](https://github.com/nathanbertram)
 * *Ryan Jones* - development, [ryan.michael.jones@gmail.com](mailto:ryan.michael.jones@gmail.com), 780 907 2969, [https://twitter.com/ryanonrails], [Google+](https://plus.google.com/108111379110069559271/posts), [ryanonrails on GitHub](https://github.com/ryanonrails)
 * *Vonn Gondziola* - user experience, [vonngondziola@gmail.com](mailto:vonngondziola@gmail.com), 780 237 5654, [@vonnziola on Twitter](https://twitter.com/#!/vonnziola), [Google+](https://plus.google.com/104018711410926928454/posts), [vonziola on GitHub](https://github.com/vonnziola)

## Development Process

All team members coordinate using Pivotal Tracker. It lists all the stories, tasks, bugs, and releases associated with our project in the order in which they should be completed. If you don’t have access to Pivotal Tracker or aren’t sure how to use it, contact mark@burmis.ca.

Day by day, developers should be signing in to Pivotal to find out what the team expects them to work on. If you don’t own any story and have nothing to work on then just start work on the next story listed in Pivotal. If you’re not sure about the next story, or need help deciding what to start next then send an email to the team. Please don’t wait for us to reach out to you if you’ve got nothing to do.

When you start work on a new story, first fetch the latest copy of the project repo from GitHub and then create a new git branch for your work. As you work, commit to the branch as much as necessary and freely push your branch up to GitHub. If your branch exists for more than a day, or as it gets out of sync with the master branch please merge master into your story branch.

Once you’re satisfied that you’ve completed your code push your branch to GitHub. Navigate to the project repo, open your branch and then click the “Pull Request” button. Add any comments you need to explain your change and complete the pull request. The team will be emailed and someone will review your pull request. If they’re satisfied with your changes they can merge your branch into master, otherwise please use the GitHub pull interface to comment and update the branch until the reviewer is satisfied.

*TIP:* If you’re reviewing a pull request, you can use the tabs at the top of the pull request to view the comments, commits, and change summary. You’ll probably want to start with the comments and change summary.

Once the pull request is merged into master, the continuous integration server will automatically run the tests and email the team if anything goes wrong. Assuming everything is working the integration server will deploy your code to the staging server automatically ready for demo to the rest of the team. The integration server will tweet the team to let them know the code has been deployed.

After the change has been merged and the pull request closed, please mark your story as finished and delivered. Well demo the story to the product owner at the next team demo and they’ll either accept it or reject it. Accepted stories will be deployed to production on a schedule set by the client.

Before you can run Dayhomes in development, you need to install and be running
the following on your system:

  * MySQL 5.5
  * Redis 2.4.8

## Installing

Begin by cloning the dayhomes repository from GitHub to get access to the
projects source code and build assets.

    git clone git@github.com:burmis/dayhomes.git
    cd dayhomes
    
Depending on your setup you then need to install ruby with RVM:

    rvm use --create 1.9.3-p125@dayhomes

Or install it using rbenv:

    rbenv install 1.9.3-p125@dayhomes

If you have created a new Ruby install you may need to install the Bundler gem.
Bundler uses a Gemfile to manage the dependencies of our application.

    gem install bundler

Once Bundler is installed, install the gems our project depends on with:

    bundle install --binstubs

Once the software dependencies are installed we need to configure the database.
If you haven't already you'll need to install MySQL before continuing.

First, edit your database credentials in <tt>config/database.yml</tt>. The user
credentials you enter in this file need to be able to create and admin the dev
and test databases. 

Setup your database locally

    cp config/database.yml.template config/database.yml
    rake db:create


Once you've entered your database credentials, setup the database with:

    bin/rake db:setup

You'll also want to prepare the test database with:

    bin/rake db:test:prepare

## Running the app

We're using the Foreman gem to manage our application processes. Kick off the
application with:

    bin/foreman start

Please note that MySQL and redis should be running as described in the
prerequisites section.

## Running the tests

Our app ships with a large set of tests. You can run the full suite using:

    bin/rake spec

It's also possible to monitor and run tests as you work using the guard gem:

    bin/guard

This will run tests on individual files as changes are made.

## Windows Notes

To prevent nix explosions:
bundle install --without production

## Gmaps notes

Asset generate for prod: rails generate gmaps4rails:install