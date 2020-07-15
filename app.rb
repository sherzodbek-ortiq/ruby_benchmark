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
	if params[:file].present?
  	code = params[:file][:tempfile].read
		benchmark_info  = BenchmarkInfo.create(file_name: params[:file][:filename], benchmark_status: "on process")
		BenchmarkWorker.perform_async(benchmark_info.id, code)
		json({benchmark_info_id: benchmark_info.id})
	else
		json({error:"No file"})
	end
end
