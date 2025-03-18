class QuizOption < ApplicationRecord
    belongs_to :quiz
    validates :correct, presence:true
    validates :content, presence:true
end
