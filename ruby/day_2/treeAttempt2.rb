#!/usr/bin/ruby -w

#RJM version of tree class for day 2 exercise

#Second attempt at this after seeing alternative solution at bookclub
# came up with a simplier solution, but I had to change the block format

class HashTree
	attr_accessor :data

	def initialize(data)
		@data = data
	end

	def visit_all_internal(p_data, &block)
		p_data.keys.each {
			|key|
			block.call key
			visit_all_internal(p_data[key],&block)
		}
	end

	def visit_all(&block)
		visit_all_internal(@data,&block)
	end


end

puts "\nTest tree with no children"
hash_for_tree_with_no_children = {'dad'=>{}}
tree_with_no_children = HashTree.new(hash_for_tree_with_no_children)
puts "visiting tree with no children"
tree_with_no_children.visit_all {|node_name| puts node_name}

puts "\nTest tree with 2 children"
hash_for_tree_with_mutiple_children = {'dad'=>{'child 1'=>{},'child 2'=>{}}}
tree_with_mutiple_children = HashTree.new(hash_for_tree_with_mutiple_children)
puts "visiting tree with mutiple children"
tree_with_mutiple_children.visit_all {|node_name| puts node_name}



hash_for_tree = {'grandpa'=>{'dad'=>{'child 1'=>{},'child 2'=>{}},'uncle'=>{'child 3'=>{},'child 4'=>{}}}}
ruby_other_tree = HashTree.new(hash_for_tree)

puts "\n\nvisting all tree"
ruby_other_tree.visit_all {|node_name| puts node_name}

