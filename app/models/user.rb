class User < ApplicationRecord

  
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def find_user_autentication_token(authentication_token) 
    User.find_by(authentication_token: authentication_token)
  end
end
