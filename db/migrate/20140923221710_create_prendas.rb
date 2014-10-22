class CreatePrendas < ActiveRecord::Migration
  def change
    create_table :prendas do |t|
      t.belongs_to :ocasion
      t.belongs_to :tipo_de_prenda
      t.belongs_to :orden

      t.timestamps
    end
  end
end
