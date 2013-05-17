require 'spec_helper'

describe ApiController do
  it 'should assign a weekly instance variable' do
    get :api, {:user => "sherodtaylor"}
    assigns(:weekly).should_not be_nil
  end
end
