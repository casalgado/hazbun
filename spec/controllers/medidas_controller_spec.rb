require 'spec_helper'

RSpec.describe MedidasController do

	 	before(:all) do
			@clienta = create(:clienta)
			@marca   = Marca.first
		end

		before(:each) do
			login(:marca)
		end

		describe 'GET #new' do

			it "assigns a new medida" do
				get :new, clienta_id: @clienta.id
				assigns[:medida] = Medida.new
			end

			it "assigns an existing clienta" do
				get :new, clienta_id: @clienta.id
				assigns[:clienta] = @clienta
			end

			it "renders new template" do
				get :new, clienta_id: @clienta
				response.should render_template :new
			end	 
		end

		describe 'POST #create' do

			context "with valid attributes" do

				it "saves a new medida in the database" do
					expect {
						post :create, clienta_id: @clienta.id, medida: attributes_for(:medida, clienta_id: @clienta.id)
					}.to change(Medida, :count).by(1)
				end

				it "redirects to clienta show page" do
					  post :create, clienta_id: @clienta.id, medida: attributes_for(:medida, clienta_id: @clienta.id)
					response.should redirect_to clienta_path(@clienta)
				end

			end

		end

end
