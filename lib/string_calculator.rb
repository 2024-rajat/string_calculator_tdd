# frozen_string_literal: true

# A class for performing calculations based on a provided string of numbers.
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').map(&:to_i).sum
  end
end
