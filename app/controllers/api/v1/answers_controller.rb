class Api::V1::AnswersController < ApiController
	def create
		answers = params["answers"]
		if answers.nil?
			render :json => { messgae: "Please Insert Answers"}
		else
			survey = Survey.create(phone_no: params["phone_no"], order_id: params["order_id"])
			answers.each do |answer|
	    	Answer.create(answer: answer["answer"], question_id: answer["question_id"], survey_id: survey.id) 
			end
			render :json => { message: "Answers saved successfully.", :status => 200 }
		end
	end
end
