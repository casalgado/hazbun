
require 'spec_helper'


describe Cita do

	describe "de_hoy method returns only citas de hoy" do
		before :each do
			@hoy    = create(:cita, fecha: Time.new(2014, 9, 14, 01, 00, 00))
			@hoy_2  = create(:cita, fecha: Time.new(2014, 9, 14, 23, 00, 00))
			@ayer   = create(:cita, fecha: Time.new(2014, 9, 13, 14, 00, 00))
			@mañana = create(:cita, fecha: Time.new(2014, 9, 15, 14, 00, 00))
		end

		context "check positive test" do
			it "should return only citas de hoy" do
				Cita.de_hoy.should eq [@hoy, @hoy_2]
			end
		end

		context "check negative test" do
			it "should not return citas de ayer" do
				Cita.de_hoy.should_not include @ayer
			end
		end

	end
end
