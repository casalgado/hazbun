class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :occasion

      t.timestamps
    end
  end
end
