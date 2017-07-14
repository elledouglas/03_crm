# require_relative '/contact'
require 'sinatra'
require_relative 'contact'

get '/' do
  redirect to ('/contacts')
end

get '/about' do
  erb :about
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


end

post '/contacts' do
  Contact.create(
  first_name: params[:first_name],
  last_name:  params[:last_name],
  email:      params[:email],
  note:       params[:note]
)
  redirect to ('/contacts')
end


get '/contacts/:id/edit' do
  @contact = Contact.find_by(id: params[:id])
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id])
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end


after do
  ActiveRecord::Base.connection.close
end
