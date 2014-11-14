
require 'spec_helper'
require 'faker'

RSpec.describe Customer, :type => :model do

	it "has a valid factory" do
		expect(create(:consumer)).to be_valid
	end

	it "is invalid without a first_name" do
		expect(build(:consumer, nombre: nil)).not_to be_valid
	end

	it "is invalid without a last_name" do
		expect(build(:consumer, apellido: nil)).not_to be_valid
	end

	it "is invalid with duplicate email address" do
		@email = Faker::Internet.email
		create(:consumer, email: @email)
		expect(build(:consumer, email: @email)).not_to be_valid
	end

	it "nombre_completo method returns full name" do
		expect(create(:consumer, nombre: "Dominique", apellido: "Francon").nombre_completo).to eq "Dominique Francon"
	end

end
