require 'spec_helper'

describe ApiController do
  describe '#status_board' do
    it 'should assign a weekly instance variable' do
      get :status_board, {:user => "sherodtaylor"}
      assigns(:hash).should be_a(Hash)
    end
  end

  describe '#morris' do
    it 'should render json array of hashes formatted for morris of data' do
      get :morris, { :format => 'json', :user => "sherodtaylor"}
      json = JSON.parse(response.body)
      json.should be_a(Array)
    end
  end
end
