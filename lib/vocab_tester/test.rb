module VocabTester
	class Test
		attr_accessor :words
		#attr_reader
		#attr_writer
		
		def initialize(output)
			@output = output
			@words = []
			File.open('words/words.txt', 'r') do |file|
				while line = file.gets
					line.chomp!
					@words.push(line)
				end
			end
		end
		
		def start
			@output.puts "-Welcome to Vocab Tester-"
		end
		
	end
end
