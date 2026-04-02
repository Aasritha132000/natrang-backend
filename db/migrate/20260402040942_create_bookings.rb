class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dance, null: false, foreign_key: true
      t.date :date
      t.string :time_slot
      t.string :level
      t.string :status
      t.string :notes

      t.timestamps
    end
  end
end
