# README


## On Local Server


To load ENV variables in development execute
 
 	source ~/.bashrc 
 	
before running rails server.

To modify ENV variables in heroku use:

	heroku config:add KEY_NAME=key-value

## Database creation

If you reset the database, it's important to run  
	
		rake db:seed 
	
after migrating.


## Test suite

To reset taste databse run:
	
		RAILS_ENV=test rake db:prepare

To run test run:
		
		bundle exec rspec

## Functionality

To eliminate the date of birth of a customer set year to 1944.

