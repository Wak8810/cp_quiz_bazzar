class QuizzesController < ApplicationController
    def index
        how_sort = sort_params[:sort]
        if how_sort == "desc"
            @quizzes = Quiz.order(created_at: :desc)
        elsif how_sort == "like"
            @quizzes = Quiz.like_desc
        else
            @quizzes = Quiz.all
        end
    end

    def show
        @quiz = Quiz.find(params[:id])
        @solved_quiz = @quiz.solved_quizzes.build
    end

    private

    def sort_params
        params.permit(:sort)
    end
end
