class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.string :item_type

      t.timestamps
    end
  end
end
