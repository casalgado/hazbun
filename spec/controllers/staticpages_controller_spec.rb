require 'spec_helper'

RSpec.describe StaticpagesController, :type => :controller do


	 describe "marca acces" do

	 	before(:all) do
			@marca   = Marca.find(1)
			@clienta = create(:clienta)
			@appointments   = create(:appointment, clienta: @clienta)
		end

		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:marca]
			sign_in @marca
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
