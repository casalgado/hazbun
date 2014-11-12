require 'rails_helper'

RSpec.describe CitasController, :type => :controller do
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



			it "assigns a new cita" do
				get :new, clienta_id: @clienta.id
				assigns[:cita] = Cita.new
			end

			it "assigns an existing clienta" do
				get :new, clienta_id: @clienta.id
				assigns[:clienta] = @clienta
			end

			it "renders new template" do
				get :new, clienta_id: @clienta.id
				expect(response).to render_template(:new)
			end	 
		end

		describe 'POST #create' do



			context "with valid attributes" do

				it "saves a new cita in the database" do
					expect {
						post :create, clienta_id: @clienta.id, cita: attributes_for(:next_month_cita, clienta_id: @clienta.id)
					}.to change(Cita, :count).by(1)
				end

				it "redirects to clienta show page" do
					  post :create, clienta_id: @clienta.id, cita: attributes_for(:next_month_cita, clienta_id: @clienta.id)
					expect(response).to redirect_to clienta_path(@clienta)
				end

			end

			context "with in-valid attributes" do

				it "does not save the new cita in the database" do
					expect {
						post :create, clienta_id: @clienta.id, cita: attributes_for(:invalid_cita, clienta_id: @clienta.id)
					}.to_not change(Cita, :count)
				end

				it "redirects to new cita page" do
						post :create, clienta_id: @clienta.id, cita: attributes_for(:invalid_cita, clienta_id: @clienta.id)
						expect(response).to render_template :new
				end

			end
		end


end
