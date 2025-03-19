class Quizzes::ApplicationController < ApplicationController
    before_action :set_quiz

    private

    def set_quiz
        @quiz = Quiz.find(params[:quiz_id])
    end
end