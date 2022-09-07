class User < ApplicationRecord  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, presence: true

  has_many :created_posts, foreign_key: :creator_id, class_name: "Post"
end
