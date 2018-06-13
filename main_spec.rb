require File.dirname(__FILE__) + '/main.rb'
require 'rack/test'
require 'rspec'

# set :environment, :test

def app
  Sinatra::Application
end

describe "testing api" do
  before(:all) do
    url = "https://kasiatest.zendesk.com/api/v2/tickets.json?&per_page=25&page=1"  
    auth = {:username => "kasiazendesk@gmail.com", :password => "zendesk2012"}
    @result = HTTParty.get(url,:basic_auth => auth)
  end
  include Rack::Test::Methods
  it "returns data" do
    expect(@result["tickets"]).to be_truthy
  end
  it "returns array of 25 tickets per page" do
    expect(@result["tickets"].count).to eql(25)
  end
  it "returns total 101 tickets" do
    expect(@result["count"]).to eql(101)
  end
  it "returns 35 items per ticket" do
    expect(@result["tickets"][0].count).to eql(35)
  end
end

