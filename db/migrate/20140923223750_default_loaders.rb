class DefaultLoaders < ActiveRecord::Migration
  def up
  	ItemType.load
  	Ocasion.load
  	TipoDeCita.load
  end

  def down
  	ItemType.destroy_all
  	Ocasion.destroy_all
  	TipoDeCita.destroy_all
  end
end
