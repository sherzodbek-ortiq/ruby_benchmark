require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
set :database_file, 'config/database.yml'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

get '/' do
	json BenchmarkInfo.all
end