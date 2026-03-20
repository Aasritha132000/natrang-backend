class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dance
  validates :rating, inclusion: { in: 1..5 }
end
