require_relative 'contact'
require 'sinatra'

get '/index' do
  erb :index
end

get '/contacts' do

  erb :contacts

end

get '/about' do

  erb :about
end




after do
  ActiveRecord::Base.connection.close
end
