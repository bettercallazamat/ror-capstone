# Twitter-Redesign (MVP)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

## In this project we are creating an application for creating events.

This project is a web applocation which is a redesign of Twitter.

## MVP version** of the app:

1. The user logs in to the app, only by typing the username.
2. The user is presented with the homepage that includes:
    1. Left-side menu.
    2. Tweets tab in the centre.
    3. Right-side section with Who to follow.
3. The Tweets section includes:
    1. Simple form for creating a tweet.
    2. List of all tweets (sorted by most recent) that display tweet text and author details.
    3. List of all comments for tweets that display comment text and author details
4. The Who to follow section includes:
    1. List of profiles that are not followed by the logged-in user
5. When the user opens the profile page, they can see:
    1. Left-side menu.
    2. Cover picture and Tweets tab in the centre.
    3. Right-side section with Profile detailed info.
6. The Profile detailed info section includes:
    1. User photo.
    2. Button to follow a user.
    3. Stats: total number of tweets, number of followers and number of following users.
    4. List of people who follow this user.

In this project the following was used:
- Ruby, RoR
- HTML, CSS, SCSS
- RSpec, Capybara
- Bootstrap
- FontAwesome
- Active Storage

# Getting a Copy and Contributing

This project is open for anyone who wants to clone it and create their version. If you just want the files and don't want to make further changes, follow the steps below to get a copy in your computer:

1 - Install git in your machine. Follow [this guide](https://www.theodinproject.com/courses/web-development-101/lessons/setting-up-git) by The Odin Project if you haven't done so.

2 - Open your terminal, select the folder where you want to store this project and paste the following code

# Required Installations

If you want a copy of this project running on your machine you have to install:

- Ruby 2.6
- gem 3.0
- Bundler 1.17
- Rails 6.0

For installation instructions follow [The Instalation Guide](https://www.tutorialspoint.com/ruby-on-rails/rails-installation)

# Instalation of This App

Once you have installed the requiered packages shown on the [Required Installations](), proceed with the following steps

Clone the Repository, the folder ror-capstone will be downloaded

```Shell
your@pc:~$ git clone git@github.com:bettercallazamat/ror-capstone.git
```

Move to the downloaded folder

```Shell
your@pc:~$ cd ror-capstone
```

install gems

```Shell
your@pc:~$ bundle install --without production
```

migrate the database

```Shell
your@pc:~$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rspec .
```

If the test suite passes, you'll be ready to run the app in a local server:

```Shell
your@pc:~$ rails s

```

Then, go to [http://localhost:3000/](http://localhost:3000/)

Bazinga!

## Author

👤 **Azamat Nuriddinov**

- Github: [@bettercallazamat](https://github.com/bettercallazamat)
- Twitter: [@azamat_nuriddin](https://twitter.com/azamat_nuriddin)
- Linkedin: [Azamat Nuriddinov](https://www.linkedin.com/in/azamat-nuriddinov-57579868)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to submit a new suggestion > [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
This project was build based on [the design](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details) from behance.com which is designed by the great professional [Gregoire Vella](https://www.behance.net/gregoirevella).

[contributors-shield]: https://img.shields.io/github/contributors/bettercallazamat/ror-capstone.svg?style=flat-square
[contributors-url]: https://github.com/bettercallazamat/ror-capstone/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/bettercallazamat/ror-capstone.svg?style=flat-square
[forks-url]: https://github.com/bettercallazamat/ror-capstone/network/members
[stars-shield]: https://img.shields.io/github/stars/bettercallazamat/ror-capstone.svg?style=flat-square
[stars-url]: https://github.com/bettercallazamat/ror-capstone/stargazers
[issues-shield]: https://img.shields.io/github/issues/bettercallazamat/ror-capstone.svg?style=flat-square
[issues-url]: https://github.com/bettercallazamat/ror-capstone/issues
