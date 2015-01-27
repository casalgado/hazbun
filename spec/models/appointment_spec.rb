
require 'spec_helper'


describe Appointment, :type => :model do



	describe "de_hoy method returns only citas de hoy" do
		before :each do
			@customer  = create(:customer)
			@time_t    = Time.now + 86400
			@time_y    = Time.now - 86400
			@today     = create(:appointment, date: Time.now, 	   	  		 customer_id: @customer.id, appointment_type_id: "2")
			@today_2   = create(:appointment, date: Time.now,  	   	  		 customer_id: @customer.id, appointment_type_id: "2")
			@tomorrow  = create(:appointment, date: Time.at(@time_t.to_i), customer_id: @customer.id, appointment_type_id: "2")
			@yesterday =  build(:appointment, date: Time.at(@time_y.to_i), customer_id: @customer.id, appointment_type_id: "2")
		end

		context "check positive test" do
			it "should return only todays appointments" do
				expect(Appointment.at_(Date.today)).to eq [@today, @today_2]
			end
		end

		context "check negative test 1" do
			it "should not return appointments from yesterday" do
				expect(Appointment.at_(Date.today)).not_to include @yesterday
			end
		end	

		context "check negative test 2" do
			it "should not return appointments from tomorrow" do
				expect(Appointment.at_(Date.today)).not_to include @tomorrow
			end
		end

	end
end
