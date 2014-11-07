
require 'spec_helper'


describe Orden do

	it "has a valid factory" do
		create(:orden).should be_valid
	end

	it "allows create if previous orders are closed" do
		clienta = create(:clienta)
		create(:orden, clienta: clienta, cerrada: true)
		build(:orden, clienta: clienta).should be_valid
	end


	it "only allows create when client has no open orders" do
		clienta = create(:clienta)
		create(:orden, clienta: clienta)
		build(:orden, clienta: clienta).should_not be_valid
	end

	

end

