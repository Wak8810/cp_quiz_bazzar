class QuizzesApplicationController < UsersApplicationController
    before_action :set_quiz

    private
    def set_quiz
        @quiz = @user.quizzes.find(params[:quiz_id])
end