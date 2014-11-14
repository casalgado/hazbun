require 'rails_helper'

RSpec.describe AppointmentsController, :type => :controller do
	render_views

	 	before(:all) do
			@marca = create(:marca)
		end

		before(:each) do
			@clienta = create(:clienta)
			@request.env["devise.mapping"] = Devise.mappings[:marca]
			sign_in @marca
		end

		describe 'GET #new' do



			it "assigns a new appointment" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:appointment)).to be_a_new(Appointment)
			end

			it "assigns an existing clienta" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:clienta)).to eq(@clienta)
			end

			it "renders new template" do
				get :new, clienta_id: @clienta.id
				expect(response).to render_template(:new)
			end	 
		end

		describe 'POST #create' do



			context "with valid attributes" do

				it "saves a new appointment in the database" do
					expect {
						post :create, clienta_id: @clienta.id, appointment: attributes_for(:next_month_appointment, clienta_id: @clienta.id)
					}.to change(Appointment, :count).by(1)
				end

				it "redirects to clienta show page" do
					  post :create, clienta_id: @clienta.id, appointment: attributes_for(:next_month_appointment, clienta_id: @clienta.id)
					expect(response).to redirect_to clienta_path(@clienta)
				end

			end

			context "with in-valid attributes" do

				it "does not save the new appointment in the database" do
					expect {
						post :create, clienta_id: @clienta.id, appointment: attributes_for(:invalid_appointment, clienta_id: @clienta.id)
					}.to_not change(Appointment, :count)
				end

				it "redirects to new appointment page" do
						post :create, clienta_id: @clienta.id, appointment: attributes_for(:invalid_appointment, clienta_id: @clienta.id)
						expect(response).to render_template :new
				end

			end
		end


end
