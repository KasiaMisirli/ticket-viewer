require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

get '/' do
  erb(:home)
end

get '/api' do
  url = "https://kasiatest.zendesk.com/api/v2/tickets.json?&per_page=25&page=#{params[:page]}"  
  auth = {:username => "kasiazendesk@gmail.com", :password => "zendesk2012"}
  result = HTTParty.get(url,:basic_auth => auth)
  @tickets = result.parsed_response["tickets"]
  @page = (params[:page].to_i)
  @alltickets = result["count"]
  erb (:index)
end

get '/api/:id' do
  url="https://kasiatest.zendesk.com/api/v2/tickets/#{params[:id]}.json"
  auth = {:username => "kasiazendesk@gmail.com", :password => "zendesk2012"}
  result = HTTParty.get(url,:basic_auth => auth)
  @single = result.parsed_response["ticket"]
  erb (:single)
end

not_found do
  status 404
  erb(:error)
end

