class User < ApplicationRecord
  has_secure_password

  validates :name, presence: { message: "Name cannot be blank" }
  validates :email, 
            presence: { message: "Email cannot be blank" },
            uniqueness: { message: "Email already registered" },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Enter a valid email address" }
  validates :password, 
            length: { minimum: 6, message: "Password must be at least 6 characters" },
            allow_nil: true
has_many :bookmarks
has_many :bookmarked_dances, through: :bookmarks, source: :dance
has_many :progresses
has_many :completed_videos, through: :progresses, source: :video
has_many :reviews

end
