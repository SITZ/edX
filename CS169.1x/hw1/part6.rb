class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000}
  
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
	end
  end
  
  def in(currency)
  	currency = currency.to_s.gsub(/s$/, '')
  	if @@currencies.has_key?(currency)
  		self / @@currencies[currency]
  	else
  		super
  	end
  end
  
end

class String
	def palindrome?
		str = self.downcase.gsub(/[^a-zA-Z0-9]/, '')
		str == str.reverse
	end
end

module Enumerable
	def palindrome?
		forward  = []
		backward = []
		each { |i| forward << i }
		reverse_each { |i| backward << i }
		forward == backward
	end
end
