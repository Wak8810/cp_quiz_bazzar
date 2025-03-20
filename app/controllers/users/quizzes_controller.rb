class Users::QuizzesController < Users::ApplicationController
    def index
        @quizzes = @user.quizzes.order(created_at: :desc)
    end

    def show
        @quiz = Quiz.find(params[:id])
        @quiz_options = @quiz.quiz_options
    end

    def new
        @quiz = @user.quizzes.build
        4.times { @quiz.quiz_options.build }
    end

    def create
        @quiz = @user.quizzes.build(quiz_params)
        if @quiz.save
            redirect_to user_quizzes_path(@user), notice: "クイズを作成しました"
        else
            render :new
        end
    end

    def destroy
        @quiz = @user.quizzes.find(params[:id])
        @quiz.destroy!
        redirect_to user_quizzes_path(@user), notice: "クイズを削除しました"
    end

    def edit
        @quiz = @user.quizzes.find(params[:id])
    end

    def update
        @quiz = @user.quizzes.find(params[:id])
        if @quiz.update(quiz_params)
            redirect_to user_quiz_path(@quiz), notice: "クイズを更新しました"
        else
            render :edit
        end
    end

    private
    def quiz_params
        params.require(:quiz).permit(
            :title, :content, :hint, :explanation,
            quiz_options_attributes: [ :id, :content, :correct, :_destroy ]
        )
    end
end
