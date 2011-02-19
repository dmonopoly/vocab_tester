=begin
module WordsHelper
	class Words < Array # acts as a test double
		def initialize
			@words = %w{ a few words }
		end
	end
	
	def words
		@words ||= Words.new
	end
end
=end
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
