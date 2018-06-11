require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'



def reverse string
  string.each_char.to_a.reverse.join
end

get '/' do
  erb(:home)
end


get '/api' do
  url= "https://kasiatest.zendesk.com/api/v2/tickets.json?&per_page=25&page=#{params[:page]}"
  auth = {:username => "kasiazendesk@gmail.com", :password => "zendesk2012"}
  result = HTTParty.get(url,:basic_auth => auth)
  @tickets = result.parsed_response["tickets"]
  erb (:index)
end

get '/api/:id' do
  url="https://kasiatest.zendesk.com/api/v2/tickets/#{params[:id]}.json"
  auth = {:username => "kasiazendesk@gmail.com", :password => "zendesk2012"}
  result = HTTParty.get(url,:basic_auth => auth)
  @single = result.parsed_response["ticket"]
  erb (:single)
end




