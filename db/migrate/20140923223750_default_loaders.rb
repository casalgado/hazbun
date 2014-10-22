class DefaultLoaders < ActiveRecord::Migration
  def up
  	TipoDePrenda.load
  	Ocasion.load
  	TipoDeCita.load
  end

  def down
  	TipoDePrenda.destroy_all
  	Ocasion.destroy_all
  	TipoDeCita.destroy_all
  end
end
