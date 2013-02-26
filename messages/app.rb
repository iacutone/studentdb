# app.rb
 
# lookup sinatra reloader
 
# 1. The post_message.rb must submit a POST request to localhost:9292 
# (this running sinatra application). It should post 
# to, from, content variables along with the request.
# Lookup how to submit POST requests using net/http
# and how to submit data along with that request
 
# 2. Build out the post '/' routes below in this file
# to take the incoming data and create a message from it
# you will need to lookup some basics on datamapper
# the getting started guide is a good place to start
# and you will need to lookup how to get POST
# data out of the request in sinatra
 
# 3. You need to edit messages.erb to iterate
# through all the @messages and print out the
# data
require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
 
ENV['DATABASE_URL'] ||= 'postgres://ericiacutone:@localhost/eric'
 
DataMapper.setup(:default, ENV['DATABASE_URL'])
 
get '/' do
  @messages = Message.all
  erb :messages
end
 
get '/migrate' do
  DataMapper.auto_migrate!
  "Database migrated! All tables reset."
end
 
post '/' do
  message = request.POST
  @message_row = Message.new(:from => message["from"],
                             :content => message["content"])
  @message_row.save

  "success"
end
 
class Message
  include DataMapper::Resource
 
  property :id, Serial            # Auto-increment integer id
  property :from, String          # A short string of text
  property :content, Text         # A longer text block
  property :created_at, DateTime  # Auto assigns data/time
end
 
DataMapper.finalize
DataMapper.auto_upgrade!
