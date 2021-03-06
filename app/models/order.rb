class Order < ActiveRecord::Base

	# Associations:

	belongs_to :customer
	belongs_to :brand
	belongs_to :employee
	has_many   :payments
	
	has_many   :items, :dependent => :destroy
	accepts_nested_attributes_for :items, allow_destroy: true, update_only: true

	# Validations: 

	validates_uniqueness_of :closed, scope: [:customer_id, :brand_id], message: "Customer ya tiene una orden abierta"
	validates_presence_of :customer_id

	# Scopes:

	scope :open,   -> { where(closed: false) }
  scope :closed, -> { where(closed: true) }

	# Uploader:

	# Methods:

	# los 3 siguientes dos metodos se usan en ordenes#show para cerrar las ordenes. 

	def total_abonado
		total = 0
		self.payments.each do |payment|
			total += payment.amount
		end
		total
	end

	def cerrar
		self.closed = true
		self.save
	end

	def cerrable?
		true
	end


	# (1) para calcular si tiene y cuando es la proxima cita

	def next_appointment
		appointment = self.customer.appointments.last || nil
		if appointment && appointment.date >= Date.today
			appointment
		end
	end

	
end
