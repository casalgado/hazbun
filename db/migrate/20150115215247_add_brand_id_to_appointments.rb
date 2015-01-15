class AddBrandIdToAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :brand_id, :integer
  end
end
