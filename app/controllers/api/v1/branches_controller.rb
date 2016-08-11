class Api::V1::BranchesController < ApiController

  def index
  	@branches = @user.branches

  	render json: @branches
  end
end
