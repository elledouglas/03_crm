# require_relative '/contact'
require 'sinatra'
require_relative 'contact'

get '/' do
  redirect to ('/about')
end

get '/about' do
  erb :about
end

# get '/contacts' do
# @contacts = Contact.all
# puts"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{@contacts}"
#   erb :contacts
# end

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
get '/add_contact' do
  erb :add_contact
end
### ADD A CONTACT #######################
post '/add_contact' do
  Contact.create(
  first_name: params[:first_name],
  last_name:  params[:last_name],
  email:      params[:email],
  note:       params[:note]
)
  redirect to ('/contact')
end

#####  EDIT A CONTACT #############################

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

##### DELETE A CONTACT ###############################
delete '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id])
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
