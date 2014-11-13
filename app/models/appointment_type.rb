class AppointmentType < ActiveRecord::Base

	has_many :appointments

	def self.load
		types = ['Primera', 'Medicion', 'Medicion Final', 'Entrega']
    types.each do |type|
    AppointmentType.create(:appointment_type => type)
    end
	end

end
