module LoginMacros

	def login_user(request, user, user_sym)
			request.env["devise.mapping"] = Devise.mappings[user_sym]
			sign_in user
	end

end