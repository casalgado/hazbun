class AddPictureToClients < ActiveRecord::Migration
  def change
    add_column :clients, :picture, :string
  end
end
