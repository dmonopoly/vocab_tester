module VocabTester
	class Test
		# others = attr_accessor, attr_writer
		attr_reader :words, :queue, :current_word

		def initialize(output)
			@words = read_file
			@output = output
			@queue = []
		end

		def start
			put_initial_messages
			put_word_from_word_list
		end

		def reply(input) # program's reply based on user's input
			if input == '.'
        dequeue(@current_word) if @queue.include? @current_word
			elsif input == 'e'
				enqueue(@current_word)
			end
			put_next_word
		end

    def put_next_word
      if !@words.empty?
        put_word_from_word_list
      elsif !@queue.empty?
        put_word_from_queue
      else
        puts "Congratulations! You have exhausted all the words."
        return -1
      end
    end

    def dequeue item
      @queue.delete item
    end

		def enqueue item
			@queue.push item
		end

		def put_word_from_queue
			@current_word = @queue.first
			@output.puts @current_word
			@output.print '>'
		end

		def remove_from_word_list item
			@words.delete(item)
		end

    # not used anywhere except in features...
		def add_to_word_list item
		  @words.push item
    end

		def put_word_from_word_list
			@current_word = word_from_word_list
			@output.puts(@current_word)
			@output.print '>'
			remove_from_word_list(@current_word)
		end

		private
      def word_from_word_list
        @words.sample
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
						line.strip! # just added strip
						array.push(line) unless line == '' # just added this unless condition
					end
					array
				}
			end
	end
end

