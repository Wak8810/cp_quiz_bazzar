class UsersQuizOptionsController < UsersApplicationController
    before_action :set_quiz_option, only: [:edit, :update, :destroy]

    def index
        @quiz_options = @quiz.quiz_options
    end
    
    def new
        @quiz_option = @quiz.quiz_options.build
    end

    def create
        @quiz_option = @quiz.quiz_options.build(quiz_option_params)
        if @quiz_option.save
            redirect_to user_quiz_path(@quiz)
        else
            # フラッシュの文
            render :new
        end
    end

    def edit
    end

    def update
        if @quiz_option(quiz_option_params).update
            redirect_to user_quiz_path(@quiz)
        else
            # フラッシュ文
            render :edit
        end
    end

    def destroy
        @quiz_option.destroy!
        # フラッシュ文
        redirect_to user_quiz_path(@quiz)
    end

    private
    def quiz_option_params
        params.require(:quiz_option).permit(:correct, :content)
    end

    def set_quiz_option
        @quiz_option = @quiz.quiz_options.find(params[:id])
    end

end