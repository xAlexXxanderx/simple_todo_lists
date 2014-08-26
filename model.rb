require 'sinatra'
require 'data_mapper'
require 'bcrypt'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class User
  include DataMapper::Resource

  property :id,           Serial,     :key => true
  property :username,     String,     :length => 3..20
  property :password,     BCryptHash
end

class Project
  include DataMapper::Resource
  
  property :id,           Serial,     :key => true
  property :name,         String,     :length => 1..50
  property :user_id,      Integer
end

class Task
  include DataMapper::Resource
  
  property :id,           Serial,     :key => true
  property :name,         String,     :length => 1..50
  property :status,       DateTime
  property :project_id,   Integer
end

DataMapper.finalize
DataMapper.auto_upgrade!
