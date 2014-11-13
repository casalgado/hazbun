
FactoryGirl.define do 
	factory :appointment do
		association :client
		appointment_type_id '1'
		date Time.new(Date.today.year, Date.today.month, Date.today.mday, 14, 00, 00)

		factory :next_month_appointment do
			next_month = Date.today.month + 1
			next_month = 1 if next_month == 13
			date Time.new(Date.today.year, next_month, Date.today.mday, 14, 00, 00)			
		end

		factory :invalid_appointment do
			appointment_type_id nil
		end

	end

end

