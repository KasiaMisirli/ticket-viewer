require File.dirname(__FILE__) + '/main.rb'
require 'rack/test'

# set :environment, :test

def app
  Sinatra::Application
end

describe "testing api" do
  include Rack::Test::Methods
  it "should load the home page" do
    get '/'
    last_response.status.should == 200
  end
  it "should load the api page" do
    get '/api'
    last_response.status.should == 200
  end
  it "should return json" do
    get '/api'
    json = JSON.parse(response.body)
    expect(json['api']).to eql('ok')
  end
end

