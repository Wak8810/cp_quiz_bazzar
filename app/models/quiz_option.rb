class QuizOption < ApplicationRecord
    belongs_to :quiz
    has_many :solved_quizzes, dependent: :destroy
    validates :content, presence: true
end
