
require 'spec_helper'


describe Orden, :type => :model do

	it "has a valid factory" do
		expect(create(:orden)).to be_valid
	end

	it "allows create if previous orders are closed" do
		clienta = create(:clienta)
		create(:orden, clienta: clienta, cerrada: true)
		expect(build(:orden, clienta: clienta)).to be_valid
	end


	it "only allows create when client has no open orders" do
		clienta = create(:clienta)
		create(:orden, clienta: clienta)
		expect(build(:orden, clienta: clienta)).not_to be_valid
	end

	

end

