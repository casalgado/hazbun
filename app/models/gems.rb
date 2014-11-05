gem 'carrierwave'

	-> rails g uploader image_uploader

	-> rails g migration add_image_to_prendas image:string 
	-> rake db:migrate

	Luego en la clase

	mount_uploader :image, ImageUploader

	luego se agrega el image call al attr_accesible (en mi caso a strong params?)

	Luego en la view

		f.file_field :image

		se pone @model, :html => { :multipart => true }