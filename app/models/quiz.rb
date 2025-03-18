class Quiz < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :content, presence: true
    validates :explanation, presence: true
end