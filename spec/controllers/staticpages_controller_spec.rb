require 'spec_helper'

RSpec.describe StaticpagesController do


	 describe "client acces" do

	 	before(:all) do
			@marca   = Marca.find(1)
			@clienta = create(:clienta)
			@citas   = create(:cita, clienta: @clienta)
		end

		before(:each) do
			login(:marca)
		end

		 describe 'GET #dashboard' do

			it "render the :dahsboard view" do
				get :dashboard
				response.should render_template :dashboard
			end

			it "shows todays appointments" do
				get :dashboard
				assigns[:citas_de_hoy] = [@citas]
			end

	 
	end
 end
end
