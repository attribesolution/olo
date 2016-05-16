class Api::V1::AnswersController < ApiController
	def create
		answers = params["answers"]
		if answers.nil?
			render :json => { messgae: "Atleast one answer is required."}
		else
      begin
  			survey = Survey.create(phone_no: params["phone_no"], order_id: params["order_id"])
  			answers.each do |answer|
  	    	Answer.create(answer: answer["answer"], question_id: answer["question_id"], survey_id: survey.id) 
  			end
  			render :json => { message: "Answers saved successfully.", :status => 200 }
      rescue Exception => e
        render :json => { message: e.message, status: 201 }
      end
		end
	end
  
end
