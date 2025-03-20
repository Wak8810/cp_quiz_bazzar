class Quizzes::SolvedQuizzesController < Quizzes::ApplicationController
    def create
        @solved_quiz = @quiz.solved_quizzes.build(solved_quiz_params.merge(user_id: current_user.id))
        @solved_quiz.save!
        @result = @solved_quiz.quiz_option.correct
        respond_to do |format|
            format.turbo_stream { render turbo_stream: turbo_stream.replace("result_frame", partial: "quizzes/result", locals: { result: @result }) }
        end
    end

    # todo 非ログインユーザーでも解答出来るように
    def guest_result
        selected_answer = @quiz.quiz_options.find(params[:solved_quiz][:quiz_option_id])
        @result = selected_answer.correct
        respond_to do |format|
            format.turbo_stream { render turbo_stream: turbo_stream.replace("result_frame", partial: "quizzes/result", locals: { result: @result }) }
        end
    end

    private

    def solved_quiz_params
        params.require(:solved_quiz).permit(:quiz_option_id)
    end
end
