require 'spec_helper'

RSpec.describe StaticpagesController, :type => :controller do


	 describe "employee acces" do

	 	before(:each) do
			@brand        = Brand.find(1)
			@customer     = create(:customer)
			@employee     = create(:employee)
			@request.env["devise.mapping"] = Devise.mappings[:employee]
			sign_in @employee
		end

		 describe 'GET #dashboard' do

			it "render the :dahsboard view" do
				get :dashboard
				expect(response).to render_template :dashboard
			end

			it "shows todays appointments" do
				appointment1 = create(:appointment, customer: @customer)
				appointment2 = create(:appointment, customer: @customer)
				get :dashboard
				expect(assigns(:citas_de_hoy)).to eq([appointment1, appointment2])
			end

	 
	end
 end
end
