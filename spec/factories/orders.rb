
FactoryGirl.define do 
	factory :order do
		closed false
		association :client	
	end

end

