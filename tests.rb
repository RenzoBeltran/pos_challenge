require './classes/Terminal'

def __test__
  puts "Testing the first suite"
  terminal = Terminal.new
  first_testing_suite = %i[A B C D A B A A]

  first_testing_suite.each_with_index do |suite, index|
    puts "#{index}: #{suite}"
    terminal.scan(suite)
  end
  if terminal.total_price == 32.40
    puts "Expected: 32.4\n
    Got: #{terminal.total_price}
    First testing suite passed"
  else
    puts "There were an error:\nExpected: 32.40\nGot: #{terminal.total_price}"  
  end

  puts "Testing the second suite"
  terminal2 = Terminal.new
  second_testing_suite = %i[C C C C C C C]

  second_testing_suite.each_with_index do |suite, index|
    puts "#{index}: #{suite}"
    terminal2.scan(suite)
  end
  if terminal2.total_price == 7.25
    puts "Expected: 7.25\n
    Got: #{terminal2.total_price}
    Second testing suite passed"
  else
    puts "There were an error:\nExpected: 7.25\nGot: #{terminal2.total_price}"  
  end

  puts "Testing the third suite"
  terminal3 = Terminal.new
  third_testing_suite = %i[A B C D]

  third_testing_suite.each_with_index do |suite, index|
    puts "#{index}: #{suite}"
    terminal3.scan(suite)
  end
  if terminal3.total_price == 15.40
    puts "Expected: 15.4\n
    Got: #{terminal3.total_price}
    Third testing suite passed"
  else
    puts "There were an error:\nExpected: 15.40\nGot: #{terminal3.total_price}"  
  end
end

__test__