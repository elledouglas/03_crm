gem 'activerecord', '=4.2.7'

require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'CRM.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{ first_name } #{ last_name }"
  end

  # kathleen = Contact.new("Kathleen", "Douglas", "kathleendouglas@gmail.com", "123")
  # puts kathleen
end

Contact.auto_upgrade!

at_exit do
  ActiveRecord::Base.connection.close
end
#Contact.auto_upgrade!
