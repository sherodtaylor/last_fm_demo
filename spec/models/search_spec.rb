require 'spec_helper'

describe Search do
  before do
    stub_request(:get, "http://ws.audioscrobbler.com/2.0/?api_key=5e851473c4eb515d9edf03d0a720bfb9&format=json&method=user.getweeklyartistchart&user=sherodtaylor").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => fixture('api_return.txt'), :headers => {})
  end

  describe '#lastfm_api_call' do
    it 'should return a hash' do
      Search.lastfm_api_call("sherodtaylor").should be_a(Array)
    end
  end
end
