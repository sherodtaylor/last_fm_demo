class ApiController < ApplicationController
  def status_board
    user_params = params[:user]
    weekly = Search.lastfm_api_call(user_params)
    api_call = weekly.map{|a| { 'title' => a['name'], 'value' => a['playcount']}}
    @hash = {
      'graph' => {
        'type' => 'bar',
        'title' =>"Weekly",
        'total' => true,
        'xAxis' => { 'showEveryLabel' => true },
        'datasequences' => [
           'title' => "Top Artist's for #{user_params}",
           'datapoints' =>
              api_call
        ]
      }
    }
    respond_to do |format|
      format.json  { render :json => @hash }
    end
  end

  def index
  end

  def morris
    user = params[:user]
    call = Search.lastfm_api_call(user)
    @data = call.map{|a| { 'name' => a['name'], 'playcount' => a['playcount']}}
    respond_to do |format|
      format.json { render :json => @data }
    end
  end
end
