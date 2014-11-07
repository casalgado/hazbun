
require 'spec_helper'


describe Cita do

TipoDeCita.load

	describe "de_hoy method returns only citas de hoy" do
		before :each do
			@clienta   = create(:clienta)
			@time_t    = Time.now + 86400
			@time_y    = Time.now - 86400
			@from_dashboard = Cita.find(3)
			@today     = create(:cita, fecha: Time.now, 	 			 clienta_id: @clienta.id, tipo_de_cita_id: "2")
			@today_2   = create(:cita, fecha: Time.now,  	 			 clienta_id: @clienta.id, tipo_de_cita_id: "2")
			@tomorrow  = create(:cita, fecha: Time.at(@time_t.to_i), clienta_id: @clienta.id, tipo_de_cita_id: "2")
			@yesterday = build(:cita, fecha: Time.at(@time_y.to_i), clienta_id: @clienta.id, tipo_de_cita_id: "2")
		end

		context "check positive test" do
			it "should return only todays appointments" do
				Cita.de_hoy.should eq [@from_dashboard, @today, @today_2]
			end
		end

		context "check negative test 1" do
			it "should not return appointments from yesterday" do
				Cita.de_hoy.should_not include @yesterday
			end
		end	

		context "check negative test 2" do
			it "should not return appointments from tomorrow" do
				Cita.de_hoy.should_not include @tomorrow
			end
		end

	end
end
