class Item < ActiveRecord::Base

	# Associations:

	belongs_to :order
	belongs_to :ocasion
	belongs_to :item_type
	has_many   :appointments

	has_many :supplies_per_item
	has_many :supplies, through: :supplies_per_item
	has_many :supplies, :dependent => :destroy
	accepts_nested_attributes_for :supplies, :reject_if => lambda { |a| a[:quantity].blank? }, allow_destroy: true, update_only: true

	# Validations:

	# Uploader: 

	mount_uploader :picture, PictureUploader

	# Methods:

end
