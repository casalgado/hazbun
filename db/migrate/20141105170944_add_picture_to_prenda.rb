class AddPictureToPrenda < ActiveRecord::Migration
  def change
    add_column :prendas, :picture, :string
  end
end
