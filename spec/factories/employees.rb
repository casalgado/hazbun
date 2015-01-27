FactoryGirl.define do
  factory :employee do
    brand_id '1' 
    first_name { Faker::Name.first_name }
		last_name  { Faker::Name.last_name }
		email      { Faker::Internet.email }
    marriage 'spouse' 
    position 'job' 
    city 'barranquilla' 
    land_phone '12345' 
    mobile_phone '56789' 
    date_of_birth '12-02-86' 
    id_number '112233' 
    password "password"
		password_confirmation "password"
  end

end
