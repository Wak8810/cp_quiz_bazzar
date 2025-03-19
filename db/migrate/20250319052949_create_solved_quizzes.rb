class CreateSolvedQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :solved_quizzes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.references :quiz_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
