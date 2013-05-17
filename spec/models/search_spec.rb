require 'spec_helper'

describe Search do
  describe '#formatted_code' do
    it 'should return a hash' do
      Search.formatted_code("sherodtaylor").should be_a(Hash)
    end
  end
end
