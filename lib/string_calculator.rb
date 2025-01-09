# frozen_string_literal: true

# A class for performing calculations based on a provided string of numbers.
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter_and_numbers(numbers)

    numbers = numbers.split(delimiter).map(&:to_i)
    negative_numbers = numbers.select(&:negative?)

    raise "negative numbers not allowed #{negative_numbers.join(', ')}" if negative_numbers.size.positive?

    numbers.sum
  end

  def self.extract_delimiter_and_numbers(numbers)
    if numbers.start_with?('//')
      delimiter = numbers[2]
      [delimiter, numbers[3..]]
    else
      [',', numbers.gsub("\n", ',')]
    end
  end
end
