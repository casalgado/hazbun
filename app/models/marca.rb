class Marca < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clientas

  # Marca.new(email:'judy@judy.com', password:'judyjudy', password_confirmation:'judyjudy')
end
