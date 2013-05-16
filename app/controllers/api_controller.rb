class ApiController < ApplicationController
  def api
    user_params = params[:user]
    @weekly = Search.formatted_code(user_params)
    respond_to do |format|
      format.json  { render :json => @weekly }
    end
  end
end
