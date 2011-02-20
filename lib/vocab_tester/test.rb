module VocabTester
	class Test
		# others = attr_accessor, attr_writer
		attr_reader :words, :queue, :current_word
		
		def initialize(output)
			@words = read_file
			@output = output
			@current_word = next_word
			@queue = []
		end
		
		def start
			put_initial_messages
			put_random_word
			@output.puts '>'
		end
		
		def reply(input)
			if input == '.'
				remove_from_words(@current_word)
			elsif input == 'e'
				add_to_queue(@current_word)
			end
		end
		
		private
			def next_word # from words list, not queue
				@words.sample if @words
			end
			
			def remove_from_words item
				@words.delete item
			end
			
			def add_to_queue item
				@queue.push item
				remove_from_words item
			end
			
			def put_random_word
				@current_word = next_word
				@output.puts(@current_word)
			end
			
			def put_initial_messages
				@output.puts "-Welcome to Vocab Tester-"
				@output.puts "Commands:"
				@output.puts ". -> next word, I understand this one; e -> enqueue"
				@output.puts ''
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
