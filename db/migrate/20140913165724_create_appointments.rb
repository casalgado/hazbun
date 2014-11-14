class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.belongs_to :prenda
    	t.belongs_to :customer
    	t.belongs_to :appointment_type
      t.datetime   :date

      t.timestamps
    end
  end
end
