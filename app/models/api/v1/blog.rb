class Api::V1::Blog < ApplicationRecord

  has_many :comments, class_name: 'Api::V1::Comment', foreign_key: 'api_v1_blog_id', dependent: :destroy
  validates :title, presence: true 
  validates :body, presence: true 
  validates :user_id, presence: true 
end
