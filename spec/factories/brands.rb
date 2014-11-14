require 'faker'


FactoryGirl.define do
  factory :brand do
  		nombre    "Judy"
			apellido  "Hazbun"
			marca     "Judy Hazbun"
			email     "judy@hazbun.com"
			password  'domidomi'
			password_confirmation 'domidomi'

		factory :amalin_brand do
			nombre   "Amalin"
			apellido "de Hazbun"
			marca  	 "Amalin de Hazbun"
			email    "amalin@hazbun.com"
		end
    
  end

end
