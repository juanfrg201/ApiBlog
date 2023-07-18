class Api::V1::Blog < ApplicationRecord


  validates :title, presence: true 
  validates :body, presence: true 
  validates :user_id, presence: true 
end
