class Api::V1::QuestionsController < ApiController
	def index
		@questions = @user.questions.order('created_at DESC')
		if @questions.blank?
			return render :json => { messgae: "You have not added any question", status => 200 }
		end
	end
end
