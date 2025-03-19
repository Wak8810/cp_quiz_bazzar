class Users::Quizzes::CommentsController < Users::Quizzes::ApplicationController
    def index
        @comments = @user.comment.order(created_at: :desc)
    end

    def show
        @comment = comment.find(params[:id])
    end

    def new
        @comment = @user.comment.build
    end

    def create
        @comment = @user.comment.build(quiz_params)
        if @comment.save
            redirect_to user_commentzes_path
        else
            render :new
        end
    end

    def destroy
        @comment = @user.comment.find(params[:id])
        @comment.destroy!
        redirect_to user_commentzes_path
    end

    def edit
        @comment = @user.comment.find(params[:id])
    end

    def update
        @comment = @user.comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to user_comment_path(@comment)
        else
            render :edit
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
