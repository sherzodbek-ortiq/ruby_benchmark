require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL_SIDEKIQ'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL_SIDEKIQ'] }
end

class BenchmarkWorker
	include Sidekiq::Worker

	def perform(ruby_script)
		case complexity
		when "super_hard"
			sleep 20
			puts "super_hard"
		when "medium_hard"
			sleep 10
			puts "medium_hard"
		when "minimum_hard"
			sleep 1
			puts "minimum_hard"
		end			
	end
end