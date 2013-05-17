require 'spec_helper'

describe Search do
  describe '#lastfm_api_call' do
    it 'should return a hash' do
      Search.lastfm_api_call("sherodtaylor").should be_a(Array)
    end
  end
end
