
require 'spec_helper'
require 'faker'

RSpec.describe Customer, :type => :model do

	it "has a valid factory" do
		expect(create(:customer)).to be_valid
	end

	it "is invalid without a first_name" do
		expect(build(:customer, nombre: nil)).not_to be_valid
	end

	it "is invalid without a last_name" do
		expect(build(:customer, apellido: nil)).not_to be_valid
	end

	it "is invalid with duplicate email address" do
		@email = Faker::Internet.email
		create(:customer, email: @email)
		expect(build(:customer, email: @email)).not_to be_valid
	end

	it "nombre_completo method returns full name" do
		expect(create(:customer, nombre: "Dominique", apellido: "Francon").nombre_completo).to eq "Dominique Francon"
	end

end
