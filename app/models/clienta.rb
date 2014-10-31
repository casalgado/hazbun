class Clienta < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  belongs_to :marca
  has_many   :citas
  has_many   :ordenes
  has_many   :medidas
  has_many   :abonos, through: :ordenes

  validates :nombre  , presence: true, length: { minimum: 4 }
  validates :apellido, presence: true, length: { minimum: 4 }


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

  
  
end
