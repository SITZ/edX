class CartesianProduct
	include Enumerable
  
	def initialize(sequence1, sequence2)
		@cp = []
		sequence1.each { |element1|
			sequence2.each { |element2|
				@cp << [element1, element2]
			}
		}
	end
  
	def each
		@cp.each { |elt| yield elt }
	end
end
