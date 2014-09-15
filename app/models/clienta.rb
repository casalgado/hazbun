class Clienta < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  belongs_to :marca
  has_many   :ordenes
  has_many   :citas,  through: :ordenes
  has_many   :abonos, through: :ordenes

  validates :nombre  , presence: true, length: { minimum: 4}
  validates :apellido, presence: true, length: { minimum: 4}

  def nombre_completo
  	[self.nombre, self.apellido].join(" ")
  end

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
