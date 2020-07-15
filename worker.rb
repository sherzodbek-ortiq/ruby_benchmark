require 'sinatra'
require 'sinatra/activerecord'
require 'sidekiq'
require 'benchmark'
set :database_file, 'config/database.yml'
current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL_SIDEKIQ'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL_SIDEKIQ'] }
end

class BenchmarkWorker
	include Sidekiq::Worker

	def perform(benchmark_info_id, code)
		exit_status = system("ruby", "-e", "#{code}")
		if exit_status
			execution_time = []
			100.times{execution_time << Benchmark.realtime{system("ruby", "-e", "#{code}")}}
			BenchmarkInfo.find(benchmark_info_id).update(
				average_execution_time: execution_time.inject{ |sum, el| sum + el }.to_f / execution_time.size,
				median_execution_time: median(execution_time),
				min_execution_time: execution_time.min,
				max_execution_time: execution_time.max,
				error_message: "Exit status: 0",
				benchmark_status: "completed"
			)
		else
			BenchmarkInfo.find(benchmark_info_id).update(
				benchmark_status: "completed",
				error_message: "Exit status: " + (exit_status == false ? "1" : "nil")
			)
		end
	end

	def median(array)
	  return nil if array.empty?
	  sorted = array.sort
	  len = sorted.length
	  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
	end

end