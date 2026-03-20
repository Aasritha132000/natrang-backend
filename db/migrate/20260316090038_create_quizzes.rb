class CreateQuizzes < ActiveRecord::Migration[8.1]
  def change
    create_table :quizzes do |t|
      t.integer :dance_id
      t.text :question
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d
      t.string :correct_answer

      t.timestamps
    end
  end
end
