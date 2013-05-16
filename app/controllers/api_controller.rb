class ApiController < ApplicationController
  def api
    user_params = params[:user]
    @top_artists = Search.formatted_code(user_params)
    render :json => @top_artists
  end
end
