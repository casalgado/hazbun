== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

before running terminal run "source ~/.bashrc (to load ENV variables in Development)"

add ENV keys to heroku with heroku config:add KEY_NAME=key-value

* Database creation

	run 
	
		rake db:seed 
	
	after migrating

* Database initialization

* How to run the test suite

	before test run:
	
		RAILS_ENV=test rake db:prepare

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* User Interface

	To eliminate the date of birth of a customer set year to 1944

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
