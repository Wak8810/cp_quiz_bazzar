class Quizzes::SolvedQuizzesController < Quizzes::ApplicationController
    def create
        @solved_quiz = @quiz.solved_quizzes.build(solved_quiz_params.merge(user_id: current_user.id))
        @solved_quiz.save!
        redirect_to quizzes_path
    end

    # todo 非ログインユーザーでも解答出来るように
    # def guest_result
    #     @result = (true or false)
    #     if @result
    #         正解を表示
    #     else
    #         不正解を表示
    #     end
    # end

    private

    def solved_quiz_params
        params.require(:solved_quiz).permit(:quiz_option_id)
    end
end