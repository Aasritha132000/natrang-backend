class CreateVideos < ActiveRecord::Migration[8.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_url
      t.string :level
      t.string :duration
      t.references :dance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
