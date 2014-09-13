class CreateTipoDeCitas < ActiveRecord::Migration
  def change
    create_table :tipo_de_citas do |t|
      t.string :tipo_de_cita

      t.timestamps
    end
  end
end
