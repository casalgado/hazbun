class CreateTipoDePrendas < ActiveRecord::Migration
  def change
    create_table :tipo_de_prendas do |t|
      t.string :tipo_de_prenda

      t.timestamps
    end
  end
end
