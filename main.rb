# frozen_string_literal: true

require_relative './lib/linked_list.rb'

list = LinkedList.new
puts "Test #at: Index 0 is #{list.at 0}" #=> nil

puts list # => nil
puts "Head node: #{list.head}" #=> nil
puts "Tail node: #{list.tail}" #=> nil
puts "Test size: #{list.size}" #=> nil
puts
puts 'Test appending'
list.append(5)
list.append(7)
list.append(8)
puts "Test #at: Index 0 is #{list.at 0}" #=> 5
puts "Test #at: Index 2 is #{list.at 2}" #=> 8
puts "Test #at: Index 15 is #{list.at 15}" #=> nil
puts list
puts "Head node: #{list.head}" #=> 5
puts "Tail node: #{list.tail}" #=> 8
puts "Test size: #{list.size}" #=> 3
puts

puts 'Test prepending'
list.prepend(4)
puts "Test #at: Index 0 is #{list.at 0}" #=> 4
puts "Test #at: Index 2 is #{list.at 2}" #=> 7
puts "Test #at: Index 15 is #{list.at 15}" #=> nil
puts list
puts "Head node: #{list.head}" #=> 4
puts "Tail node: #{list.tail}" #=> 8
puts "Test size: #{list.size}" #=> 4
puts

puts 'Test #pop'
list.pop
puts "Test #at: Index 0 is #{list.at 0}" #=> 4
puts "Test #at: Index 2 is #{list.at 2}" #=> 7
puts "Test #at: Index 15 is #{list.at 15}" #=> nil
puts list
puts "Head node: #{list.head}" #=> 4
puts "Tail node: #{list.tail}" #=> 7
puts "Test size: #{list.size}" #=> 3
puts

puts 'Test #contains?(value)'
puts list
puts "List contains 8?: #{list.contains? 8}" #=> false
puts "List contains 7?: #{list.contains? 7}" #=> true
puts "List contains 4?: #{list.contains? 4}" #=> true

puts 'Test #find(value)'
puts list
puts "Find the index of 4: #{list.find 4}" #=> 0
puts "Find the index of 5: #{list.find 5}" #=> 1
puts "Find the index of 7: #{list.find 7}" #=> 2
puts "Find the index of 15: #{list.find 15}" #=> nil

puts 'Test #insert_at'
puts list
list.insert_at 25, 0
list.insert_at 100, 3
list.insert_at 42, 2
list.insert_at 9_999, 6
list.insert_at 158_147, 23 #=> no effect
puts list #=> ( 25 ) -> ( 4 ) -> (42) -> (5) -> (100) -> ( 7 ) -> (99999) -> nil
puts "Head node: #{list.head}" #=> 25
puts "Tail node: #{list.tail}" #=> 9999
puts "Test size: #{list.size}" #=> 7

puts 'Test #remove_at'
puts list
list.remove_at 0
puts list #=> ( 4 ) -> ( 42 ) -> ( 5 ) -> ( 100 ) -> ( 7 ) -> ( 99999 ) -> nil
puts "Head node: #{list.head}" #=> 4
puts "Tail node: #{list.tail}" #=> 9999
puts "Test size: #{list.size}" #=> 6
list.remove_at 1
puts list #=> ( 4 ) -> ( 5 ) -> ( 100 ) -> ( 7 ) -> ( 99999 ) -> nil
puts "Head node: #{list.head}" #=> 4
puts "Tail node: #{list.tail}" #=> 9999
puts "Test size: #{list.size}" #=> 5
list.remove_at 4
puts list #=> ( 4 ) -> ( 5 ) -> ( 100 ) -> ( 7 ) -> nil
puts "Head node: #{list.head}" #=> 4
puts "Tail node: #{list.tail}" #=> 7
puts "Test size: #{list.size}" #=> 4

list.remove_at(-1)
puts list #=> ( 4 ) -> ( 5 ) -> ( 100 ) -> ( 7 ) -> nil
puts "Head node: #{list.head}" #=> 4
puts "Tail node: #{list.tail}" #=> 7
puts "Test size: #{list.size}" #=> 4

list.remove_at 4
puts list #=> ( 4 ) -> ( 5 ) -> ( 100 ) -> ( 7 ) -> nil
puts "Head node: #{list.head}" #=> 4
puts "Tail node: #{list.tail}" #=> 7
puts "Test size: #{list.size}" #=> 4
