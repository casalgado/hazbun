
require 'faker'


FactoryGirl.define do 
	factory :clienta do
		nombre   { Faker::Name.first_name }
		apellido { Faker::Name.last_name }
		email    { Faker::Internet.email }
		password "domidomi"
		password_confirmation "domidomi"
		
	end
end

