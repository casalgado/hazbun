# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medida do
  	association :clienta
		talle_frente  "60"
		talle_espalda "60"
		imperio       "60"
		contorno      "60"
		espalda       "60"
		busto         "60"
		cintura       "60"
		cadera        "60"
		costado       "60"
		cotilla       "60"
		hombro        "60"
  end
end
