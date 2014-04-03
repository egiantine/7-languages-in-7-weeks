#!/usr/bin/ruby

# === Find a method that substitutes part of a string
# === Print the string "Hello, world"
puts "Heyyo, woryd".gsub("y", "l")

# === For the string "Hello, Ruby" find the index of "Ruby"
"Hello, Ruby".index("Ruby")

# === Print your name 10x
5.times { puts "nina\n" * 2 }

# === Print the string "This is sentence number foo," for foo from 1 to 10
1.upto(10) {|i| puts "This is sentence number #{i}" }
 
# === Write a program that lets a player try to guess a random number
puts "now guess a number in [1..10]"
num = rand(10)
while (i = gets.to_i) != num
  puts "too low try again" if i < num
  puts "too high try again" if i > num
end
puts "you got it: #{num}"