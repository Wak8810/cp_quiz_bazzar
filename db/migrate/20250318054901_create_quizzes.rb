class CreateQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :hint
      t.text :explanation, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
