require 'spec_helper'

describe ApiController do
  before do
    stub_request(:get, "http://ws.audioscrobbler.com/2.0/?api_key=#{ENV['LAST_FM_API']}&limit=10&format=json&method=user.getweeklyartistchart&user=sherodtaylor").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => fixture("api_return.txt"), :headers => {})
  end
  describe '#status_board' do
    it 'should assign a weekly instance variable' do
      get :status_board, {:user => "sherodtaylor"}
      assigns(:hash).should be_a(Hash)
    end

    it 'should be formatted for statusboard' do
      get :status_board, {:user => "sherodtaylor"}
      assigns(:hash)['graph']['type'].should eq 'bar'
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
