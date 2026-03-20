class Video < ApplicationRecord
  belongs_to :dance

  validates :title, presence: true
  validates :level, presence: true

  scope :beginner, -> { where(level: "Beginner") }
  scope :intermediate, -> { where(level: "Intermediate") }
  scope :advanced, -> { where(level: "Advanced") }
has_many :progresses
end
