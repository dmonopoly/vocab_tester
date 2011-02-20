module OutputHelper
	class Output # acts as a test double
		def messages
			@messages ||= []
		end
	
		def puts(message)
			messages << message
		end
	end

	def output
		@output ||= Output.new
	end
end

World(OutputHelper)
