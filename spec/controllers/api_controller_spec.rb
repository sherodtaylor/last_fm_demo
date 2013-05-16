require 'spec_helper'

describe ApiController do
  it 'should create a new instance of the Search model' do
    get :api
    assigns(:search).should_not be_nil
  end
end
