class Quiz < ApplicationRecord
    belongs_to :user
    has_many :quiz_options
    has_many :solved_quizzes
    has_many :commets
    validates :title, presence: true
    validates :content, presence: true
    validates :explanation, presence: true
end
