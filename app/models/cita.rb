class Cita < ActiveRecord::Base

	# Associations:

	belongs_to :clienta
	belongs_to :tipo_de_cita
	belongs_to :prenda

	# Validations:

	validates :tipo_de_cita, presence: { message: "Debe seleccionar tipo de cita"}
	validates :clienta_id, presence: true
	validate :date_must_be_later_than_today

	# Scopes:

	scope :appointment_in_future, -> { where("citas.fecha > ? ", Date.today) }

	# Methods:	

	# Para validar

	def date_must_be_later_than_today
		errors.add(:fecha, "Fecha invalida") if
      !fecha.blank? and fecha < Date.today
	end

	# Para mostrar las citas del dia 

	def self.de_hoy
		Cita.where(fecha: Time.now.beginning_of_day..Time.now.end_of_day)
	end

	# (2) Para meter al array que va a .js (se usa en static_pages#calendario)

	def to_event_format
		new_time = self.fecha.one_hour
		event = {title: self.clienta.nombre_completo, start: self.fecha, end: new_time, backgroundColor: self.backgroundcolor, borderColor: self.backgroundcolor}
		event
	end

	def backgroundcolor
		color = '#88c656' if self.tipo_de_cita_id == 1
		color = '#f9ab53' if self.tipo_de_cita_id == 2
		color = '#ec7151' if self.tipo_de_cita_id == 3
		color = '#28abdb' if self.tipo_de_cita_id == 4
		color
	end


end

