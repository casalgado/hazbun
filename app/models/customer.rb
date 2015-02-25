class Customer < ActiveRecord::Base

  # Devise:

      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, :confirmable,:authentication_keys => [:email, :brand_id]

  # Callbacks

  before_save :titleize_names

  # Associations:

  belongs_to :brand
  has_many   :appointments
  has_many   :orders
  has_many   :measurements
  has_many   :payments, through: :orders

  # Validations:

  validates :first_name, presence: { message: "Nombre no debe estar en blanco" }  , length: { minimum: 3, message: "Nombre muy corto (minimo 3 caracteres)" } 
  validates :last_name, presence: { message: "Apellido no debe estar en blanco" }, length: { minimum: 3, message: "Apellido muy corto (minimo 3 caracteres)" }
  validates :email, presence: { message: "Email no debe estar en blanco" }, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/, message: "Email invalido" }
  
  # Scopes

  scope :has_appointment, -> {
    joins(:appointments).group("customers.id").merge(Appointment.appointment_in_future)
   }

  scope :active,   -> { 
    joins(:orders).group("customers.id").merge(Order.open)
  }

  scope :inactive, -> { 
    where.not(id: Customer.active.collect { |customer| customer.id } ) 
  }

  # Uploader:

  mount_uploader :picture, PictureUploader

  # Birthdays:

  acts_as_birthday :date_of_birth

  # Methods:


  # This method returns the customers full name
  def full_name
  	[self.first_name, self.last_name].join(" ")
  end

  # Next method determines if customer is active. 

  def active?(current_employee)
    if Order.where(customer_id: self.id, brand_id: current_employee.brand.id).open.empty? == true
      false
    else
      true
    end
  end

  # To determine if customer has a next appointment set

  def has_appointment?(current_employee)
    appointments = current_employee.brand.appointments.where(customer_id: self.id)
    unless appointments.empty?
      if appointments.last.date >= Date.today
        true
      end
    else
      false
    end
  end
  
  # Los siguientes tres metodos son para que una diseñadora pueda crear una customer sin contraseña.
  # Luego la customer puede crear una contraseña para entrar a su cuenta siguiendo el mail de confirmacion.

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  # this method creates customer instances from an excell spreadsheet

  def self.load_from_excel
    doc = Roo::Excelx.new(Rails.root.join('lib/assets/hazbun_customer_database.xlsx').to_s)
    header = doc.row(1)
      (2..2039).each do |count|
        db_row = doc.row(count)
        params = Hash[header.zip db_row]
        customer = Customer.new(params)
        customer.save
      end   
  end

  # To capitalize database names before save

  def titleize_names
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
  end

  protected

  # For devise to authenticate with email + scope

  def self.find_for_authentication(warden_conditions)
    where(:email => warden_conditions[:email], :brand_id => warden_conditions[:brand_id]).first
  end


end
