class Dance < ApplicationRecord
  has_many :videos, dependent: :destroy
has_many :quizzes  
  validates :name, presence: true
  validates :region, presence: true
  validates :dance_type, presence: true
has_many :reviews
  scope :classical, -> { where(dance_type: "Classical") }
  scope :folk, -> { where(dance_type: "Folk") }
has_many :bookmarks
end
