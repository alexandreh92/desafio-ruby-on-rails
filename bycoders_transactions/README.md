<h1 align="center">
    <img alt="bycoders" src="https://i.imgur.com/hGLbfAS.png" width="224" height="48" />
    <br>
    <p><span style="color:#00f0a2">Financial</span> Importer</p>
</h1>

<p align="center">
  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/alexandreh92/desafio-ruby-on-rails">

  <a href='https://coveralls.io/github/alexandreh92/desafio-ruby-on-rails?branch=master'>
<img src='https://coveralls.io/repos/github/alexandreh92/desafio-ruby-on-rails/badge.svg?branch=master' alt='Coverage Status' />
</a>

  <a href="https://codeclimate.com/github/alexandreh92/desafio-ruby-on-rails">
    <img alt="Code Climate technical debt" src="https://img.shields.io/codeclimate/tech-debt/alexandreh92/desafio-ruby-on-rails">
  </a>

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/alexandreh92/desafio-ruby-on-rails">

  <img alt="GitHub" src="https://img.shields.io/github/license/alexandreh92/desafio-ruby-on-rails">
</p>

<h3 align="center">
  Hi, this is the bycoders (CNAB) Financial Importer. This application was made for bycoders's Ruby on Rails challenge.
</h3>

<h4 align="center">Basically this application imports a <a href="https://github.com/alexandreh92/desafio-ruby-on-rails/blob/master/CNAB.txt">.txt file</a>, parses its data to PostgreSQL database and shows to user a table with the parsed data</h4>

<br/>

<p align="center">
  <a href="https://bycoders-cnab.herokuapp.com" target="_blank">
    <img alt="Demo on Netlify" src="https://res.cloudinary.com/practicaldev/image/fetch/s--lPYRHjTu--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/yhsx4dce2f7l0iiufibi.jpg" width="150">
  </a>
</p>

---

## Prerequisites

Have the following features with their respective versions installed on the machine:

- Ruby `2.6.6` - You can use [RVM](http://rvm.io)
- PostgreSQL 12
  - OSX - `$ brew install postgresql` or install [Postgress.app](http://postgresapp.com/)
  - Linux - `$ sudo apt-get install postgresql`
  - Windows - [PostgreSQL for Windows](http://www.postgresql.org/download/windows/)
- Bundler `1.17.3`

## Setup the project

After you get all the [prerequisites](#prerequisites), simply execute the following commands in sequence:

```bash
1. Install the dependencies above
2. $ git clone  # Clone the project
3. $ cd bycoders_transactions # Go into the project folder
4. $ gem install bundler # Bundler install
5. $ bin/bundle install # Install the gem dependencies
7. $ bin/rake dev # Reset and seed the database
8. $ bin/rspec # Run the specs to see if everything is working fine
```

## Feature improvements for next releases

- Add websockets to importer service and view

---

Thanks for the opportunity, this was made with ♥&nbsp;by alexandreh92 :wave:&nbsp; [Get in touch!](https://www.linkedin.com/in/alexandreh92/)
