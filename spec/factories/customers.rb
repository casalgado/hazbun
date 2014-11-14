require 'faker'


FactoryGirl.define do
  factory :customer do
    nombre   { Faker::Name.first_name }
		apellido { Faker::Name.last_name }
		email    { Faker::Internet.email }
		brand_id "1"
		password "password"
		password_confirmation "password"

		factory :amalin_consumer do
			brand_id "2"
		end



  end
end
