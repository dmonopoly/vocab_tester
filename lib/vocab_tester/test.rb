module VocabTester
	class Test
		def initialize(output)
			@output = output
			
			@words = []
			File.open('../words/words.txt', 'r') do |file|
				while line = file.gets
					line.chomp!
					@words.push(line)
				end
			end
			attr_accessor :words
			#attr_reader
			#attr_writer
		end
		
		def start
		end
		
		# that ruby method...
	end
end
