require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL_SIDEKIQ'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL_SIDEKIQ'] }
end

class BenchmarkWorker
	include Sidekiq::Worker

	def perform(code)
		STDERR.puts system("ruby", "-e", "#{code}")
	end
end