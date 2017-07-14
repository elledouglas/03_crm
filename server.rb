require 'sinatra'
require_relative 'contact'
#relative is a file I WROTE not a gem
get '/' do
  redirect to ('/about')

end

get '/about' do
erb :about
end

get '/contact' do
  erb :contact
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get 'contacts/:id' do
  contact_id = params[:id]
  @contacts = Contact.find(contact_id)

  erb :contact
end

get 'add_contact' do
  erb :add_contact
end

post '/contact/:id' do
"Edit contact #{params}"
erb
end


delete '/contact' do
  "DELETE request: #{params}"
  end

#sinatra provides params - the wildcard is in this hash!
