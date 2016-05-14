class Api::V1::AnswersController < ApiController
	def create
		@survey = Survey.create(phone_no: params["phone_no"], order_id: params["order_id"])
		@answer = Answer.new(answer: params[:answer], question_id: params[:question_id], phone_no: params[:phone_no], order_id: params[:order_id]) 
		@answer.survey = @survey
		@answer.save

		render :json => { message: "Answers saved successfully.", :status => 200 }
	end
end
