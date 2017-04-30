# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Details

* Ruby version: 2.4

* Database initialization: `rails db:seed`

* How to run the test suite: `rspec -f d`

* Deployment instructions: **todo**

## References

* JWT Authorization: https://www.pluralsight.com/guides/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api

---

## Models

### User
* has_many Questions, Answers (through Questions)

### Question
* question
* has_many Tags, Answers
* type: enum

### Answer
* question_id
* has_many Responses, Measurements, Captures

### Response
* text

### Capture
* has_many Media

### Measurement
* number
* type: enum

### Media
* type: enum
* url
* name
* description
