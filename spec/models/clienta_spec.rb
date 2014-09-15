
require 'spec_helper'
require 'faker'

describe Clienta do

	it "has a valid factory" do
		create(:clienta).should be_valid
	end

	it "is invalid without a first_name" do
		build(:clienta, nombre: nil).should_not be_valid
	end

	it "is invalid without a last_name" do
		build(:clienta, apellido: nil).should_not be_valid
	end

	it "is invalid with duplicate email address" do
		@email = Faker::Internet.email
		create(:clienta, email: @email)
		build(:clienta, email: @email).should_not be_valid
	end

	it "nombre_completo method returns full name" do
		create(:clienta, nombre: "Dominique", apellido: "Francon").nombre_completo.should eq "Dominique Francon"
	end

end

