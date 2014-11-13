class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
			t.string  :supply_name
			t.string  :supply_type
			t.string  :supply_color

      t.timestamps
    end
  end
end
