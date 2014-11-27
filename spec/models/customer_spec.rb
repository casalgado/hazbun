
require 'spec_helper'
require 'faker'

RSpec.describe Customer, :type => :model do

	it "has a valid factory" do
		expect(create(:customer)).to be_valid
	end

	it "is invalid without a first_name" do
		expect(build(:customer, first_name: nil)).not_to be_valid
	end

	it "is invalid without a last_name" do
		expect(build(:customer, last_name: nil)).not_to be_valid
	end

	it "is invalid with duplicate email address" do
		@email = Faker::Internet.email
		create(:customer, email: @email)
		expect(build(:customer, email: @email)).not_to be_valid
	end

	it "full_name method returns full name" do
		expect(create(:customer, first_name: "Dominique", last_name: "Francon").full_name).to eq "Dominique Francon"
	end

end
