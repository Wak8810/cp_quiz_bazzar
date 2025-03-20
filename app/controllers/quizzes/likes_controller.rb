class Quizzes::LikesController < Quizzes::ApplicationController
    def create
        @like = current_user.likes.build(quiz: @quiz)
        @like.save!
        redirect_to root_path
    end

    def destroy
        @like = current_user.likes.find_by(quiz: @quiz)
        @like.destroy!
        redirect_to root_path
    end
end
