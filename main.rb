require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'


get '/api' do
  url= "https://kasiatest.zendesk.com/api/v2/tickets.json?&per_page=25&page=#{params[:page]}"
  auth = {:username => "kasiazendesk@gmail.com", :password => "zendesk2012"}
  result = HTTParty.get(url,:basic_auth => auth)
  @tickets = result.parsed_response["tickets"]
  erb (:index)
end




