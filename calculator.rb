class Calculator
  def self.add(numbers)
    raise ArgumentError, 'Please use only single string' unless numbers.is_a?(String)
    return 0 if numbers.empty?

    numbers_arr = parse_numbers(numbers)
    numbers_arr.sum
  end

  class << self
    private

    def parse_numbers(numbers)
      delimiter = numbers.start_with?('//') ? numbers[2] : ','
      cleaned_numbers = numbers.gsub(%r{//.*\n}, '').gsub(/(?<=\d)\n(?=\d)/, delimiter)
      elements_array = cleaned_numbers.split(delimiter)
      raise 'Invalid input' unless elements_array.all?(&method(:valid?))
      elements_array.map(&:to_i)
    end

    def valid?(string)
      !string[/^[-+]?\d*\.?\d+$/].nil?
    end
  end
end
