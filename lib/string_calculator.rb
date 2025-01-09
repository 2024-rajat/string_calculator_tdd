# frozen_string_literal: true

# A class for performing calculations based on a provided string of numbers.
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?('//')
      delimiter = numbers[2]
      numbers = numbers[3..]
    else
      numbers = numbers.gsub("\n", ',')
    end

    numbers.split(delimiter).map(&:to_i).sum
  end
end
