#!/usr/bin/ruby -w

module ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module ClassMethods
		def acts_as_csvrow
			include RowMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = []
			file.gets.chomp.split(',').each { |e| @headers.push(e.strip.downcase) }

			file.each do |row|
				row_arr = row.chomp.split(',')
				row_hash = {}
				@headers.each_with_index { |field, index| row_hash[field]=row_arr[index] }
				@csv_contents << RubyCsvRow.new(row_hash)
			end
		end

		def each(&block)
			@csv_contents.each { |row| block.call row }
		end

		attr_accessor :headers, :csv_contents
		def initialize
			read
		end
	end

	module RowMethods
		def initialize(data)
			@data = data
		end
		def method_missing(argname)
			"#{@data[argname.to_s.strip.downcase]}"
		end
	end
end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end
class RubyCsvRow
	include ActsAsCsv
	acts_as_csvrow
end

m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect
##puts "Methods:#{m.methods(true)}"

m.each {|row| puts row.title2}

