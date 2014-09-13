Hazbun::Application.routes.draw do
  


  devise_for :clientas
	devise_for :marcas, controllers: { sessions: "marcas/sessions" }

  resources :ordenes


  
	root :to => "staticpages#home"
	resource :staticpages, :path => '' do 
		get 'dashboard'

	end

end
