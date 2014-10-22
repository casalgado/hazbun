Hazbun::Application.routes.draw do
  
  devise_for :clientas, path: 'c', :controllers => {:confirmations => 'confirmations'}
	devise_for :marcas, controllers: { sessions: "marcas/sessions" }

  

  devise_scope :clienta do
      put "/c/confirm" => "confirmations#confirm", :as => :clienta_confirm
    end
  
	root :to => "staticpages#home"

	resource :staticpages, :path => '' do 
		get 'dashboard'
	end

  resources :clientas do
  	resources :ordenes
    resources :medidas
    resources :citas
  end

  

end
