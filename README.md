# Cucumber web test automation suite for Ecommerce sites

Author(s): "barzilay" <barzilay@spritecloud.com>

# Introduction

Most Ecommerce sites have the same set of general features:
- Shopping basket
- Checkout
- Product detail page
- Product list page
- Search
- Account page

This example cucumber testsuite contains test scenarios that in general match the functionality of most Ecommerce sites.
For convenience, a small part of the testsuite is already automated.

# Setup

## General

- Make sure you have ruby 1.9 or later installed.
- Make sure you have firefox and/or chrome installed
- Install the bundler gem:

    $ gem install bundler

- Install all of the required gems defined in the gemfile:

    $ bundle install

- Run cucumber through bundler:

    $ bundle exec cucumber


## Importing results to Calliope.pro

The .gitlab-ci.yml file has some examples how to upload files to Calliope. There is a plain cURL command and a shell script that does the magic for you. 


# Contributing

If you create new utility functions and want to contribute them to the Lapis
Lazuli project, see https://github.com/spriteCloud/lapis-lazuli
