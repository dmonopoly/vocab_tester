module VocabTester
	class Test
		#attr_accessor :words
		attr_reader :words
		#attr_writer :words
		
		def initialize(output)
			@output = output
			@words = read_file
		end
		
		def start
			put_initial_messages
			put_random_word
			@output.puts '>'
		end
		
		private
			def put_random_word
				@output.puts @words.sample
			end
			
			def put_initial_messages
				@output.puts "-Welcome to Vocab Tester-"
				@output.puts "Commands:"
				@output.puts ". -> next word, I understand this one; e -> enqueue; d -> dequeue"
			end
			
			def read_file
				File.open('words/words.txt', 'r') { |file|
					array = []
					while line = file.gets
						line.chomp!
						array.push(line)
					end
					array
				}
			end
	end
end
