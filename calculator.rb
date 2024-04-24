# This class is responsible for converting single string arguments which contains numbers into the integer and to perform addition operation on them.
class Calculator
  def self.add(numbers)
    raise ArgumentError, 'Please use only single string' unless numbers.is_a?(String)
    return 0 if numbers.empty?

    numbers_arr = parse_numbers(numbers)
    validate_negatives(numbers_arr)
    numbers_arr.sum
  end

  class << self
    private

    def parse_numbers(numbers)
      delimiter = numbers.start_with?('//') ? numbers[2] : ',' # Determine the delimiter based on input format
      cleaned_numbers = numbers.gsub(%r{//.*\n}, '').gsub(/(?<=\d)\n(?=\d)/, delimiter)  # Clean the input string by removing extra information and replacing delimiters

      elements_array = cleaned_numbers.split(delimiter)
      raise 'Invalid input' unless elements_array.all?(&method(:valid?))

      elements_array.map(&:to_i)
    end

     # Check if a string represents a valid number
    def valid?(string)
      !string[/^[-+]?\d*\.?\d+$/].nil?
    end

    def negative_numbers(numbers)
      numbers.select(&:negative?).join(',')
    end

    # Validate if the array contains any negative numbers, raise an error if found
    def validate_negatives(numbers_arr)
      numbers_arr.each do |num|
        raise "Negative numbers not allowed: #{negative_numbers(numbers_arr)}" if num.negative?
      end
    end
  end
end
