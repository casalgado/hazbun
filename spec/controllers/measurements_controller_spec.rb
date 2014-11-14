require 'spec_helper'

RSpec.describe MeasurementsController, :type => :controller do

	 	before(:all) do
			@customer = create(:customer)
			@marca   = Marca.first
		end

		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:marca]
			sign_in @marca
		end

		describe 'GET #new' do

			it "assigns a new measurement" do
				get :new, customer_id: @customer.id
				expect(assigns(:measurement)).to be_a_new(Measurement)
			end

			it "assigns an existing customer" do
				get :new, customer_id: @customer.id
				expect(assigns(:customer)).to eq(@customer)
			end

			it "renders new template" do
				get :new, customer_id: @customer
				expect(response).to render_template :new
			end	 
		end

		describe 'POST #create' do

			context "with valid attributes" do

				it "saves a new measurement in the database" do
					expect {
						post :create, customer_id: @customer.id, measurement: attributes_for(:measurement, customer_id: @customer.id)
					}.to change(Measurement, :count).by(1)
				end

				it "redirects to customer show page" do
					  post :create, customer_id: @customer.id, measurement: attributes_for(:measurement, customer_id: @customer.id)
					expect(response).to redirect_to customer_path(@customer)
				end

			end

		end

end
