require 'spec_helper'

RSpec.describe StaticpagesController, :type => :controller do


	 describe "brand acces" do

	 	before(:all) do
			@brand   = Brand.find(1)
			@customer = create(:customer)
			@appointments   = create(:appointment, customer: @customer)
		end

		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:brand]
			sign_in @brand
		end

		 describe 'GET #dashboard' do

			it "render the :dahsboard view" do
				get :dashboard
				expect(response).to render_template :dashboard
			end

			it "shows todays appointments" do
				get :dashboard
				expect(assigns(:citas_de_hoy)).to eq([@appointments])
			end

	 
	end
 end
end
