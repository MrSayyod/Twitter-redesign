[![hire-badge](https://img.shields.io/badge/Consult%2FHire%20Sayyod-Contact%20with%20Sayyod-brightgreen)](mailto:ssayyod@gmail.com)[![Twitter Follow](https://img.shields.io/twitter/follow/sayyodsaidov?label=Follow%20Sayyod%20on%20Twitter&style=social)](https://twitter.com/sayyodsaidov)

# Twitter redesign
Twitter redesign [Project by Microverse] (Created by Sayyod Saidov)

# About Project
We are expected to build the Twitter clone-site  which allows users to share their opinions with their followers. 
User can manage signups, share his opinions with other by posting them. User can follow other users and vice versa. 

## Built With

- Ruby 2.7.0
- Ruby on Rails 6.0.3.2
- Heroku

## Live Demo

[Live version](https://obscure-oasis-18737.herokuapp.com/session/new)

## Video Description

[Twitter-redesign](https://www.loom.com/share/1356114cfccc4a7dad89580c7fc45b49)

## Additional gems

- 'bootstrap', '~> 4.5', '>= 4.5.2'
- 'carrierwave', '~> 2.1'
- 'font-awesome-rails', '~> 4.7', '>= 4.7.0.5'
- 'htmlbeautifier', '~> 1.3', '>= 1.3.1'
- 'jquery-rails'
- 'mini_magick', '~> 4.10', '>= 4.10.1'

## Tested with

- GitHub Actions
- 'capybara', '>= 2.15'
- 'rspec-rails'
- 'selenium-webdriver'
- 'shoulda-matchers'

# Getting Started

To get started, you should first get this file in your local machine by downloading this project or typing:
`
git clone https://github.com/MrSayyod/Twitter-redesign.git
`

## Prerequisites
  - Ruby installed on local machine (version: preferrable 2.7.0)
  - Ruby on Rails installed on local machine (version: preferrable 6.0.3.2)
  - Text editor (preferably: VSCode, Atom, Sublime)
  - Git
  - Postgres: >=9.5

## Setup
   If you have installed `Ruby` and `Ruby on Rails` on your machine:
   1. Clone the project into your local machine using `git clone` command or download the zip file.
   2. Go into the project directory using `cd directory name` command.
   3. Run the bundler using `bundle` or `bundle install` command
   4. Run `rails server`.
   5. From your default browser go to the http://localhost:3000/
   6. EXTRA: If you are developer you can test it in the Rails console using `rails console` command.

   ### Testing
   1. From terminal run `rails generate rspec:install` command.
   2. Add `shoulda-matchers` gem into Gemfile. Gem should be inside of `group :test`(test environment).
   3. Run the bundler using `bundle` or `bundle install` command
   4. Then add code below at the end of rails_helper.rb

    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end
   5. Run `rspec .`

# Contributing

:handshake: Contributions, issues and feature requests are welcome! 

Start by:

    1. Forking the project
    2. Cloning the project to your local machine
    3. cd into the project directory
    4. Run git checkout -b your-branch-name
    5. Make your contributions
    6. Push your branch up to your forked repository
    7. Open a Pull Request with a detailed description to the development branch of the original project for a review

Please feel free to contribute to any of these!

Feel free to check the [issues page](https://github.com/MrSayyod/Twitter-redesign/issues).

# 👤 Author

## :man_technologist: Sayyod Saidov

- Email: ssayyod@gmail.com
- Github: [@MrSayyod](https://github.com/MrSayyod) 
- LinkedIn:  [Sayyod Saidov](https://www.linkedin.com/in/sayyod-saidov-507b0818b)
- Twitter: [Sayyod Saidov](https://twitter.com/sayyodsaidov)
- Facebook: [Sayyod Saidov](https://www.facebook.com/sayyod)

## Show your support
Give a :star2: if you like this project!

## Acknowledgements

> - [Microverse](https://www.microverse.org/)
> - [The Odin Project](https://www.theodinproject.com/home)
> - [Rubocop](https://docs.rubocop.org/en/stable/)
> - [Capybara](https://github.com/teamcapybara/capybara)
> - [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
> - [Bootstrap](https://github.com/twbs/bootstrap-rubygem)
> - [Font Awesome](https://github.com/bokmann/font-awesome-rails)
> - [Carrierwave](https://github.com/carrierwaveuploader/carrierwaves)

## 📝 License
This project is MiT licensed.

