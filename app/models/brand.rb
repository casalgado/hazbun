class Brand < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]

  has_many :customers
  has_many :appointments, through: :customers
  has_many :orders, through: :customers

end
