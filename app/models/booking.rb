class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dance

  validates :date, presence: true
  validates :time_slot, presence: true
  validates :level, presence: true
  validates :status, presence: true

  before_create :set_default_status

  def set_default_status
    self.status ||= 'pending'
  end

  def self.slot_available?(dance_id, date, time_slot)
    where(dance_id: dance_id, date: date, time_slot: time_slot, status: 'confirmed').empty?
  end
end
