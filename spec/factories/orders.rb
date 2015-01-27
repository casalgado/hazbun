
FactoryGirl.define do 
	factory :order do
		closed false
		association :customer
		brand_id '1'
	end

end

