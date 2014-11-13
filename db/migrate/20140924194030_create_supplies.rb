class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
			t.string  :supply_type
			t.integer :quantity

      t.timestamps
    end
  end
end
