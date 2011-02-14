# **Gets words from file and tests your vocab**

# Get words
words = []
begin
	File.open('words.txt', 'r') do |file|
		while line = file.gets
			line.chomp!
			words.push(line)
		end
	end
rescue => err
	puts "Exception: #{err}"
	err
end
puts words.inspect
words.shuffle!
puts "randomized: " + words.inspect

# stat variables
total_num_words = words.length

# Run testing loop
queue = []

puts "| #{words[0]} |"
while 0
	reply = gets.chomp
	if reply == '1' # you understand the word
		words.delete_at 0
	elsif reply == 'enqueue' || reply == 'e' # you don't understand the word; it is added to the queue
		queue.push
	elsif reply == 'dequeue' || reply == 'd' # you want a word from the queue
		if queue.empty?
			puts "Queue is empty."
		else
			queue[0]; queue.delete_at(0)
		end
	elsif reply == 'status' || reply == 's'
		num_good = total_num_words - words.length - queue.length
		puts "# understood: #{num_good}"
		puts "# in queue: #{queue.length}"
		puts "# unseen: #{total_num_words - num_good - queue.length}"
	else
		puts 'Commands: ., enqueue (e), dequeue (d), status (s)'
	end
	unless words.empty? && queue.empty?
		puts "| #{words[0]} |"
	else
		puts "You are done."; break
	end
end
