# require_relative '/contact'
require 'sinatra'
require_relative 'contact'

get '/' do
  redirect to ('/about')
end

get '/about' do
  erb :about
end

get '/contacts' do
@contacts = Contact.all
puts"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{@contacts}"
  erb :contacts
end

get '/contact' do
  erb :contact
end

get '/contacts/:id' do
  # params[:id] contains the id from the URL
@contact = Contact.find_by({id: params[:id].to_i})
if @contact
erb :contact
else
  raise Sinatra::NotFound
end

  # erb :contacts
end

# get '/contact' do
#   #show
# erb :contact
# end






after do
  ActiveRecord::Base.connection.close
end
