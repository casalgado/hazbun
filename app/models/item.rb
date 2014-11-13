class Item < ActiveRecord::Base

	# Associations:

	belongs_to :order
	belongs_to :ocasion
	belongs_to :item_type
	has_many   :appointments

	has_many :materiales_por_prenda
	has_many :materiales, through: :materiales_por_prenda
	has_many :insumos, :dependent => :destroy
	accepts_nested_attributes_for :insumos, :reject_if => lambda { |a| a[:cantidad].blank? }, allow_destroy: true, update_only: true

	# Validations:

	# Uploader: 

	mount_uploader :picture, PictureUploader

	# Methods:

end
