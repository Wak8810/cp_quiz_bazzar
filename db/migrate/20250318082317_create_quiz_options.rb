class CreateQuizOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_options do |t|
      t.boolean :correct, null: false, default: false
      t.references :quiz, null: false, foreign_key: true
      t.timestamps
    end
  end
end
