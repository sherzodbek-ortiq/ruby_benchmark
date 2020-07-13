require 'benchmark'

puts Benchmark.measure {
	class HelloWorld
		def print_greetings(a)
			a.times do { puts "Hello, World!"}
		end
	end

	hello_world = HelloWorld.new
	hello_world.print_greetings(5)
}