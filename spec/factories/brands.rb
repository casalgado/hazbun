require 'faker'


FactoryGirl.define do
  factory :brand do
  		first_name  "Judy"
			last_name   "Hazbun"
			brand_name  "Judy Hazbun"
			email       "judy@hazbun.com"
			password    'domidomi'
			password_confirmation 'domidomi'

		factory :amalin_brand do
			first_name "Amalin"
			last_name  "de Hazbun"
			brand_name "Amalin de Hazbun"
			email      "amalin@hazbun.com"
		end
    
  end

end
