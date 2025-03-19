class AddContentToQuizOptions < ActiveRecord::Migration[8.0]
  def change
    add_column :quiz_options, :content, :string, null: false
  end
end
