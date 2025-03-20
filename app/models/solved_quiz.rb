class SolvedQuiz < ApplicationRecord
    belongs_to :user
    belongs_to :quiz
    belongs_to :quiz_option
    scope :correct, -> { joins(:quiz_option).where(quiz_option: { correct: true }) }
end
