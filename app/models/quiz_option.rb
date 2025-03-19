class QuizOption < ApplicationRecord
    belongs_to :quiz
    has_many :solved_quizzes
    validates :content, presence:true
end
