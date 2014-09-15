
FactoryGirl.define do 
	factory :cita do
		fecha Time.new(Date.today.year, Date.today.month, Date.today.mday, 14, 00, 00)
	end
end

