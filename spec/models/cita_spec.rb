
require 'spec_helper'


describe Cita, :type => :model do

TipoDeCita.load

	describe "de_hoy method returns only citas de hoy" do
		before :each do
			@clienta   = create(:clienta)
			@time_t    = Time.now + 86400
			@time_y    = Time.now - 86400
			@from_dashboard = Cita.find(1)
			@today     = create(:cita, fecha: Time.now, 	 			 clienta_id: @clienta.id, tipo_de_cita_id: "2")
			@today_2   = create(:cita, fecha: Time.now,  	 			 clienta_id: @clienta.id, tipo_de_cita_id: "2")
			@tomorrow  = create(:cita, fecha: Time.at(@time_t.to_i), clienta_id: @clienta.id, tipo_de_cita_id: "2")
			@yesterday = build(:cita, fecha: Time.at(@time_y.to_i), clienta_id: @clienta.id, tipo_de_cita_id: "2")
		end

		context "check positive test" do
			it "should return only todays appointments" do
				expect(Cita.de_hoy).to eq [@from_dashboard, @today, @today_2]
			end
		end

		context "check negative test 1" do
			it "should not return appointments from yesterday" do
				expect(Cita.de_hoy).not_to include @yesterday
			end
		end	

		context "check negative test 2" do
			it "should not return appointments from tomorrow" do
				expect(Cita.de_hoy).not_to include @tomorrow
			end
		end

	end
end
