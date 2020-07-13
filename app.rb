require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require './worker'
set :database_file, 'config/database.yml'
current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

get '/benchmark' do
	params[:id].present? ? json(BenchmarkInfo.find(params[:id])) : json(BenchmarkInfo.all)
end

post '/benchmark' do
	BenchmarkInfo.create(average_execution_time:"0.5")
	BenchmarkWorker.perform_async("minimum_hard")
  code = params[:file][:tempfile]
  return code
	#STDERR.puts params[:file][:filename]
end
