class UsersQuizzesController < UsersApplicationController
    def index
        @quizzes = @user.quizzes
    end

    def show
        @quiz = Quiz.find(params[:id])
    end

    def new
        @quiz = @user.quizzes.build
    end

    def create
        @quiz = @user.quizzes.build(quiz_params)
        if @quiz.save
            redirect_to user_quizzes_path
        else
            render :new
        end
    end

    def destroy
        @quiz = @user.quizzes.find(params[:id])
        @quiz.destroy!
        redirect_to user_quizzes_path
    end

    def edit
        @quiz = @user.quizzes.find(params[:id])
    end

    def update
        @quiz = @user.quizzes.find(params[:id])
        if @quiz(quiz_params).update
            redirect_to user_quiz_path(@quiz)
        else
            render :edit
        end
    end

    private
    def quiz_params
        params.require(:quiz).permit(:title, :content, :hint, :explanation)
    end
end
