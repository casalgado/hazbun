
require 'spec_helper'


describe Order, :type => :model do

	it "has a valid factory" do
		expect(create(:order)).to be_valid
	end

	it "allows create if previous orders are closed" do
		clienta = create(:clienta)
		create(:order, clienta: clienta, closed: true)
		expect(build(:order, clienta: clienta)).to be_valid
	end


	it "only allows create when client has no open orders" do
		clienta = create(:clienta)
		create(:order, clienta: clienta)
		expect(build(:order, clienta: clienta)).not_to be_valid
	end

	

end

