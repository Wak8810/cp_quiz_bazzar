class Quiz < ApplicationRecord
    belongs_to :user
    has_many :quiz_options
    has_many :solved_quizzes
	has_many :comments
    validates :title, presence: { message: "タイトルを入力してください" }
    validates :content, presence: { message: "問題文を入力してください" }
    validates :explanation, presence: { message: "解説を入力してください" }
end
