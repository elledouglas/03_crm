require 'sinatra'
require_relative 'contact'
#relative is a file I WROTE not a gem
get '/' do
  redirect to ('/contacts')

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
  recipe_id = params[:id]
  @contacts = Recipe.find(contact_id)

  erb :contact
end

#sinatra provides params - the wildcard is in this hash!
