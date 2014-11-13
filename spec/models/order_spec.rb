
require 'spec_helper'


describe Order, :type => :model do

	it "has a valid factory" do
		expect(create(:order)).to be_valid
	end

	it "allows create if previous orders are closed" do
		client = create(:client)
		create(:order, client: client, closed: true)
		expect(build(:order, client: client)).to be_valid
	end


	it "only allows create when client has no open orders" do
		client = create(:client)
		create(:order, client: client)
		expect(build(:order, client: client)).not_to be_valid
	end

	

end

