require 'spec_helper'

RSpec.describe StaticpagesController, :type => :controller do


	 describe "marca acces" do

	 	before(:all) do
			@marca   = Marca.find(1)
			@clienta = create(:clienta)
			@citas   = create(:cita, clienta: @clienta)
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
				assigns[:citas_de_hoy] = [@citas]
			end

	 
	end
 end
end
