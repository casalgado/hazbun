
require 'faker'


FactoryGirl.define do 
	factory :client do
		nombre   { Faker::Name.first_name }
		apellido { Faker::Name.last_name }
		email    { Faker::Internet.email }
		marca_id "1"
		password "password"
		password_confirmation "password"

		factory :amalin_client do
			marca_id "2"
		end

		
	end
end

