class Prenda < ActiveRecord::Base

	belongs_to :orden
	belongs_to :ocasion
	belongs_to :tipo_de_prenda
	has_many   :citas
	
	has_many :materiales_por_prenda
	has_many :materiales, through: :materiales_por_prenda

	has_many :insumos, :dependent => :destroy
	accepts_nested_attributes_for :insumos, :reject_if => lambda { |a| a[:cantidad].blank? }, allow_destroy: true, update_only: true


end
