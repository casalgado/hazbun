class CreateSuppliesPerItems < ActiveRecord::Migration
  def change
    create_table :supplies_per_item do |t|
			t.belongs_to :item
      t.belongs_to :supply

      t.timestamps
    end
  end
end
