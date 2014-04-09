#!/usr/bin/ruby

# === Access file with and without code block

# Using the code block, the file handle goes out of scope and is closed for you.
File.open("/etc/hosts", "r").read { |line| p line }
# Syntax w/o code block: file = File.open(...) then explicit call to file.close


# === Translate hash to array and back again
h = Hash.new; { 1=> 2, 3=> 4, 5=> nil }.to_a.each { |k,v| h[k] = v }; h


# === Iterate through a hash
{ 1=> 2, 3=> 4, 5=> nil }.each {|k,v| puts "#{k} => #{v}, " }


# === What other common data structures do arrays support?
# list, set, queue


# === Print a sixteen-number array, four at a time, using "each" and then "each_slice"
array = (1001..1016).to_a
array.each_index.select {|i| i % 4 == 0 }.each{|i| p array[i..i+3] }
array.each_slice(4) {|a| p a }


# === Change the book's Tree class to initialize from a hash
class Tree
  attr_accessor :children, :node_name
  def initialize(hash)
    @children = hash.values[0].values.collect { |h| Tree.new(h) }
    @node_name = hash.keys[0]
  end
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  def visit(&block)
    block.call self
  end
end

ruby_tree= Tree.new({"grandpa" => { "dad" => {"child 1" => {}, "child
2" => {} }, "uncle" => {"child 3" => {}, "child 4" => {} } } })

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}


# === Grep a file for a regexp
File.open("/etc/passwd", "r") { |f| f.each_line { |line| p line if line =~ /root/ } }

