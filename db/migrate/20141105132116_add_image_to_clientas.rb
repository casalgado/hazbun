class AddImageToClientas < ActiveRecord::Migration
  def change
    add_column :clientas, :image, :string
  end
end
