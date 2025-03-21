class Users::SolvedQuizzesController < Users::ApplicationController
    def index
        @solved_quizzes = @user.solved_quizzes.order(created_at: :desc)
    end
end
