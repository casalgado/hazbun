require 'spec_helper'

RSpec.describe MeasurementsController, :type => :controller do

	 	before(:all) do
			@clienta = create(:clienta)
			@marca   = Marca.first
		end

		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:marca]
			sign_in @marca
		end

		describe 'GET #new' do

			it "assigns a new measurement" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:measurement)).to be_a_new(Measurement)
			end

			it "assigns an existing clienta" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:clienta)).to eq(@clienta)
			end

			it "renders new template" do
				get :new, clienta_id: @clienta
				expect(response).to render_template :new
			end	 
		end

		describe 'POST #create' do

			context "with valid attributes" do

				it "saves a new measurement in the database" do
					expect {
						post :create, clienta_id: @clienta.id, measurement: attributes_for(:measurement, clienta_id: @clienta.id)
					}.to change(Measurement, :count).by(1)
				end

				it "redirects to clienta show page" do
					  post :create, clienta_id: @clienta.id, measurement: attributes_for(:measurement, clienta_id: @clienta.id)
					expect(response).to redirect_to clienta_path(@clienta)
				end

			end

		end

end
