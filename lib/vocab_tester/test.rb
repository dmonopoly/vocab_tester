module VocabTester
	class Test
		attr_reader :words # others = attr_accessor, attr_writer
		attr_reader :current_word
		
		def initialize(output)
			@words = read_file
			@output = output
			@current_word = next_word
		end
		
		def start
			put_initial_messages
			put_random_word
			@output.puts '>'
		end
		
		def reply(input)
			if input == '.'
				@words.delete(@current_word)
			end
		end
		
		def next_word
			@words.sample if @words
		end
		
		private
			def put_random_word
				@current_word = next_word
				@output.puts(@current_word)
			end
			
			def put_initial_messages
				@output.puts "-Welcome to Vocab Tester-"
				@output.puts "| Commands:"
				@output.puts "| . -> next word, I understand this one; e -> enqueue"
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
