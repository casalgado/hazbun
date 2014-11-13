class CreateSuppliesPerItems < ActiveRecord::Migration
  def change
    create_table :supplies_per_items do |t|
			t.belongs_to :item
      t.belongs_to :supply
      t.integer    :quantity

      t.timestamps
    end
  end
end
