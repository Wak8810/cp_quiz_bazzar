class QuizzesController < ApplicationController
    def index
        @quizzes = Quiz.all
    end

    def show
        @quiz = Quiz.find(params[:id])
        @solved_quiz = @quiz.solved_quizzes.build
    end
end
