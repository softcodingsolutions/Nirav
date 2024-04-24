class Calculator
  def self.add(numbers)
    raise ArgumentError, 'Please use only single string' unless numbers.is_a?(String)
  end
end
