class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :ocasion
      t.belongs_to :item_type
      t.belongs_to :order

      t.timestamps
    end
  end
end
