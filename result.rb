require_relative "word_from_number"
require 'benchmark'
puts "Enter 10 digit numbers"
digits = gets()
combinations = WordFromNumberConversion.new().number_to_letters(digits.chop)
puts "***********************************************"
print "Result For #{digits}\n"
print "#{combinations}\n "
puts "*******************benchmark time in seconds****************************"
puts Benchmark.measure {WordFromNumberConversion.new().number_to_letters(digits.chop)}
