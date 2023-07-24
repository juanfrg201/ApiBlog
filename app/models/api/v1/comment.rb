class Api::V1::Comment < ApplicationRecord
  belongs_to :blog, class_name: 'Api::V1::Blog', foreign_key: 'api_v1_blog_id'

  validates :body, presence: true 
end