class Brand < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clientas
  has_many :appointments, through: :clientas
  has_many :orders, through: :clientas

  # Marca.new(email:'judy@judy.com', password:'judyjudy', password_confirmation:'judyjudy')
end
