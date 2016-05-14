class Api::V1::AnswersController < ApiController
	def create
		survey = Survey.create(phone_no: params["phone_no"], order_id: params["order_id"])
		answers = params["answers"]
		answers.each do |answer|
    	Answer.create(answer: answer["answer"], question_id: answer["question_id"], survey_id: survey.id) 
		end
		render :json => { message: "Answers saved successfully.", :status => 200 }
	end
end
