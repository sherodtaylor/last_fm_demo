require 'spec_helper'

describe Search do
  before do
    stub_request(:get, "http://ws.audioscrobbler.com/2.0/?api_key=#{ENV['LAST_FM_API']}&format=json&limit=10&method=user.getweeklyartistchart&user=sherodtaylor").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => fixture('api_return.txt'), :headers => {})
  end

  describe '#lastfm_api_call' do
    it 'should return a hash' do
      Search.lastfm_api_call("sherodtaylor").should be_a(Array)
    end
  end
end
