class Quiz < ApplicationRecord
    belongs_to :user
    has_many :quiz_options
    has_many :likes
    has_many :solved_quizzes
    has_many :comments
    validates :title, presence: { message: "タイトルを入力してください" }
    validates :content, presence: { message: "問題文を入力してください" }
    validates :explanation, presence: { message: "解説を入力してください" }
    validate :validate_only_one_true
    accepts_nested_attributes_for :quiz_options, allow_destroy: true, reject_if: :all_blank
    class << self
        def like_desc
            left_joins(:likes).group('quizzes.id').order('COUNT(likes.id) desc')
        end
    end

    private

    def validate_only_one_true
        num_true = self.quiz_options.map { |option| option[:correct] }.count(true)
        if num_true != 1
            errors.add(:base, "正解の選択肢は1つにしてください")
        end
    end
end
