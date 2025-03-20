class Quizzes::CommentsController < Quizzes::ApplicationController
    def index
        @comments = Comment.order(created_at: :desc)
    end

    def new
        @comment = current_user.comments.build
    end

    def create
        @comment = current_user.comments.build(comment_params.merge(quiz: @quiz))
        if @comment.save
            redirect_to quiz_comments_path(@quiz)
        else
            render :new
        end
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        @comment.destroy!
        redirect_to quiz_comments_path(@quiz)
    end

    def edit
        @comment = current_user.comments.find(params[:id])
    end

    def update
        @comment = current_user.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to quiz_comment_path(@quiz, @comment)
        else
            render :edit
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
