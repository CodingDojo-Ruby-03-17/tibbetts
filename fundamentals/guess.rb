def guess_number
  number = rand(1...11)
  guess = 0
  puts 'Guess a number 1-10'
  while guess != number
    guess = gets.to_i
    puts 'Lower', '' if guess > number
    puts 'Higher', '' if guess < number
  end  
  puts "Nice job"
end

guess_number
