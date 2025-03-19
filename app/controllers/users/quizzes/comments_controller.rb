class Users::Quizzes::CommentsController < Users::Quizzes::ApplicationController
  def index
	@comments = @quiz.comments.order(created_at: :desc)
  end
  
end
