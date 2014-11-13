
require 'spec_helper'
require 'faker'

describe Client, :type => :model do

	it "has a valid factory" do
		expect(create(:client)).to be_valid
	end

	it "is invalid without a first_name" do
		expect(build(:client, nombre: nil)).not_to be_valid
	end

	it "is invalid without a last_name" do
		expect(build(:client, apellido: nil)).not_to be_valid
	end

	it "is invalid with duplicate email address" do
		@email = Faker::Internet.email
		create(:client, email: @email)
		expect(build(:client, email: @email)).not_to be_valid
	end

	it "nombre_completo method returns full name" do
		expect(create(:client, nombre: "Dominique", apellido: "Francon").nombre_completo).to eq "Dominique Francon"
	end

end

