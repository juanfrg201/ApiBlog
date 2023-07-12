class User < ApplicationRecord

  has_many :blogs, class_name: 'Api::V1::Blog' # Ag
  has_many :communities, class_name: 'Api::V1::Community' # Ag
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
