class SolvedQuiz < ApplicationRecord
    belongs_to :user
    belongs_to :quiz
    belongs_to :quiz_option
end