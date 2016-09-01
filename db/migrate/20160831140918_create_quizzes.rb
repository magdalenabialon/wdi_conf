class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :prompt
      t.text :problem
      t.text :answer1
      t.text :answer2

      t.timestamps
    end
  end
end
