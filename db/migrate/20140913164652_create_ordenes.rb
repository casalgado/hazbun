class CreateOrdenes < ActiveRecord::Migration
  def change
    create_table :ordenes do |t|
      t.belongs_to :clienta
      t.boolean :cerrada, default: false
      t.integer :valor_total

      t.timestamps
    end
  end
end
