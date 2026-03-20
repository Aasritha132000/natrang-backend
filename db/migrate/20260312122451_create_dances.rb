class CreateDances < ActiveRecord::Migration[8.1]
  def change
    create_table :dances do |t|
      t.string :name
      t.string :region
      t.string :dance_type
      t.text :description
      t.text :history
      t.string :image_url

      t.timestamps
    end
  end
end
