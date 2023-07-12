class Api::V1::Community < ApplicationRecord
  belongs_to :user

  validates :name, presence: true 
end
