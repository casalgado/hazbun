class StaticpagesController < ApplicationController

  before_action :authenticate_marca!, :only => [:dashboard]

	def dashboard
		
	end
	
	def home

	end

end
