class AddPictureToClientas < ActiveRecord::Migration
  def change
    add_column :clientas, :picture, :string
  end
end
