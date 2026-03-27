class CreateQuizScores < ActiveRecord::Migration[8.1]
  def change
    create_table :quiz_scores do |t|
      t.integer :user_id
      t.integer :dance_id
      t.integer :score
      t.integer :total

      t.timestamps
    end
  end
end
