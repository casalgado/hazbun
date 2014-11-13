class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :clienta
      t.boolean :closed, default: false
      t.integer :total_value

      t.timestamps
    end
  end
end
