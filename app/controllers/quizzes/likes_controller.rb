class Quizzes::LikesController < Quizzes::ApplicationController
    def create
        @like = current_user.likes.build(quiz: @quiz)
        @like.save!
        redirect_to quiz_path(@quiz)
    end

    def destroy
        @like = current_user.likes.find_by(quiz: @quiz)
        @like.destroy!
        redirect_to quiz_path(@quiz)
    end
end
