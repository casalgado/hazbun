# README


## On Local Server


Before running rails server on terminal, execute
 
 	source ~/.bashrc (to load ENV variables in Development)
 	
To modify ENV variables in heroku use:

	heroku config:add KEY_NAME=key-value

## Database creation

If you reset the database, it's important to run  
	
		rake db:seed 
	
after migrating.


## Test suite

Before test run:
	
		RAILS_ENV=test rake db:prepare

## Functionality

To eliminate the date of birth of a customer set year to 1944.

