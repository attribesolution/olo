class Api::V1::QuestionsController < ApiController
	def index
		@questions = @user.questions.order('created_at DESC')
	end
end
