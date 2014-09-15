require 'spec_helper'

describe StaticpagesController do

	it "render the :dahsboard view" do
		get :dashboard
		response.should render_template :dashboard
	end

	it "shows citas de hoy" do
		citas = Cita.de_hoy
		get :dashboard
		assigns(:citas_de_hoy).should eq citas
	end

end
