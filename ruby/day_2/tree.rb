#!/usr/bin/ruby -w

#RJM version of tree class for dat 2 exercise

#This was a very tricky example
# because the HashTree initializer can accept a hash
# hashes may contain a single node as in the book example
# but children are can be hashes with mutiple nodes e.g. child 1, child 2
# this required seperating child hashes out and cr-creating the hashes with only a single item

class HashTree
	attr_accessor :children, :node_name

	def initialize(name)
		@node_name = name.keys[0]
		#puts "Creating #{node_name}"
		@children = []
		name.keys.each {
			|c| 
			#puts "c=#{c}"
			#puts "chil_obj=#{name[c]}"
			name[c].keys.each {
				|d|
				#puts "d=#{d} => #{name[c][d]}"
				newHash = { d => name[c][d] }
				#puts "newHash=#{newHash}"
				@children.push(HashTree.new(newHash))
			}
		}
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

puts "\nTest tree with no children"
hash_for_tree_with_no_children = {'dad'=>{}}
tree_with_no_children = HashTree.new(hash_for_tree_with_no_children)
puts "visiting tree with no children"
tree_with_no_children.visit_all {|node| puts node.node_name}

puts "\nTest tree with 2 children"
hash_for_tree_with_mutiple_children = {'dad'=>{'child 1'=>{},'child 2'=>{}}}
tree_with_mutiple_children = HashTree.new(hash_for_tree_with_mutiple_children)
puts "visiting tree with mutiple children"
tree_with_mutiple_children.visit_all {|node| puts node.node_name}



hash_for_tree = {'grandpa'=>{'dad'=>{'child 1'=>{},'child 2'=>{}},'uncle'=>{'child 3'=>{},'child 4'=>{}}}}
ruby_other_tree = HashTree.new(hash_for_tree)

puts "\n\nVisit Node"
ruby_other_tree.visit {|node| puts node.node_name}

puts "\n\nvisting all tree"
ruby_other_tree.visit_all {|node| puts node.node_name}

