class Api::V1::UsersController < ApiController
	skip_before_action :authenticate_api_request
  
  def get_api_key    
    @user = User.where(passcode: params[:passcode])

    if @user.any?
      render :json => { message: "Success", api_key: @user.first.api_key, status: 200 }
    else
      render :json => { message: "Invalid passcode", api_key: "", status: 401 }
    end
  end


end
