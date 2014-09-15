class CreateAbonos < ActiveRecord::Migration
  def change
    create_table :abonos do |t|
    	t.belongs_to :orden
      t.datetime :fecha
      t.integer :valor

      t.timestamps
    end
  end
end
