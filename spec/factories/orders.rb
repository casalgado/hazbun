
FactoryGirl.define do 
	factory :order do
		closed false
		association :customer	
	end

end

