
FactoryGirl.define do 
	factory :orden do
		cerrada false
		association :clienta	
	end

end

