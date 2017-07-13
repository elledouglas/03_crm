require_relative './contact.rb'
require 'sinatra'

get '/index' do
  erb :index
end

get '/contacts' do
@contacts = Contact.all
erb :contacts
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

get '/contact.erb/' do
  #show
erb :contact
end

get '/about' do

  erb :about
end



end
after do
  ActiveRecord::Base.connection.close
end
