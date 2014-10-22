class CreateOcasiones < ActiveRecord::Migration
  def change
    create_table :ocasiones do |t|
      t.string :ocasion

      t.timestamps
    end
  end
end
