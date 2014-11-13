
require 'spec_helper'
require 'faker'

describe Clienta, :type => :model do

	it "has a valid factory" do
		expect(create(:clienta)).to be_valid
	end

	it "is invalid without a first_name" do
		expect(build(:clienta, nombre: nil)).not_to be_valid
	end

	it "is invalid without a last_name" do
		expect(build(:clienta, apellido: nil)).not_to be_valid
	end

	it "is invalid with duplicate email address" do
		@email = Faker::Internet.email
		create(:clienta, email: @email)
		expect(build(:clienta, email: @email)).not_to be_valid
	end

	it "nombre_completo method returns full name" do
		expect(create(:clienta, nombre: "Dominique", apellido: "Francon").nombre_completo).to eq "Dominique Francon"
	end

end

