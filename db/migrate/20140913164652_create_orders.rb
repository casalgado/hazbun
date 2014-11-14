class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.boolean :closed, default: false
      t.integer :total_value

      t.timestamps
    end
  end
end
