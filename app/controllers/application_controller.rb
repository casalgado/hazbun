class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception

  # El siguiente method es para determinar adonde va devise leugo del sign-in

  def after_sign_in_path_for(resource)
    if current_marca
      dashboard_staticpages_path(resource)
    end
  end

  # De aqui hasta -- es para agregar custom fields a devise

  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) << :nombre
	  devise_parameter_sanitizer.for(:sign_up) << :apellido

    devise_parameter_sanitizer.for(:account_update) << :nombre
    devise_parameter_sanitizer.for(:account_update) << :apellido
  end

  # --

end
