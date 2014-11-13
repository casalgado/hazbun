class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.belongs_to :prenda
    	t.belongs_to :clienta
    	t.belongs_to :tipo_de_cita
      t.datetime   :date

      t.timestamps
    end
  end
end
