class Clienta < ActiveRecord::Base

  # Devise:

      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Associations:

  belongs_to :marca
  has_many   :citas
  has_many   :ordenes
  has_many   :medidas
  has_many   :abonos, through: :ordenes

  # Validations:

  validates :nombre  , presence: { message: "Nombre no debe estar en blanco" }  , length: { minimum: 3, message: "Nombre muy corto (minimo 3 caracteres)" } 
  validates :apellido, presence: { message: "Apellido no debe estar en blanco" }, length: { minimum: 3, message: "Apellido muy corto (minimo 3 caracteres)" }
  validates :marca_id, presence: true
  validates :email, presence: { message: "Email no debe estar en blanco" }, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/, message: "Email invalido" }

  # Scopes

  scope :has_appointment, -> {
    joins(:citas).group("clientas.id").merge(Cita.appointment_in_future)
   }

  # Uploader:

  mount_uploader :picture, PictureUploader

  # Methods:


  # Este metodo devuelve el nombre completo de una clienta
  def nombre_completo
  	[self.nombre, self.apellido].join(" ")
  end

  # Estos dos metodos devuelven las ordenes abiertas/cerradas que la clienta tenga. 
  def ordenes_abiertas
    self.ordenes.where(:cerrada => false)
  end

  def ordenes_cerradas
    self.ordenes.where(:cerrada => true)
  end

  # para determinar si la clienta esta activa o no.

  def activa?
    if self.ordenes_abiertas.empty? == true
      false
    else
      true
    end
  end
  
  # Los siguientes tres metodos son para que una diseñadora pueda crear una clienta sin contraseña.
  # Luego la clienta puede crear una contraseña para entrar a su cuenta siguiendo el mail de confirmacion.

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

  # el siguiente metodo es para determinar si la clienta tiene una orden abierta. 

  def has_open_order?
    if self.ordenes.last.cerrada == false
      true
    else
      false
    end
    
  end

  
  
end
