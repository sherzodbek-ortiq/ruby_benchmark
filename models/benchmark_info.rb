require 'active_record'

class BenchmarkInfo < ActiveRecord::Base
	validates :file_name, presence: true
end