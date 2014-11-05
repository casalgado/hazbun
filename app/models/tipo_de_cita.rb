class TipoDeCita < ActiveRecord::Base

	has_many :citas

	def self.load
		citas = ['Primera', 'Medicion', 'Medicion Final', 'Entrega']
    citas.each do |cita|
    TipoDeCita.new(:tipo_de_cita => cita).save
    end
	end

end
