
require 'spec_helper'


describe Order, :type => :model do

	it "has a valid factory" do
		expect(create(:order)).to be_valid
	end

	it "allows create if previous orders are closed" do
		customer = create(:customer)
		create(:order, customer: customer, closed: true)
		expect(build(:order, customer: customer)).to be_valid
	end


	it "only allows create when customer has no open orders" do
		customer = create(:customer)
		create(:order, customer: customer)
		expect(build(:order, customer: customer)).not_to be_valid
	end

	

end

