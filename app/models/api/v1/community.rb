class Api::V1::Community < ApplicationRecord
  validates :name, presence: true 
end
