# frozen_string_literal: true

require 'rspec'
require './lib/string_calculator'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'StringCalculator' do
  describe '.add' do
    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'when the input is a single string' do
      context 'and the string is a valid number' do
        it 'returns the number itself' do
          expect(StringCalculator.add('5')).to eq(5)
        end
      end

      context 'and the string is an invalid number' do
        it 'returns 0' do
          expect(StringCalculator.add('a')).to eq(0)
        end
      end
    end

    context 'when the input is a string with two comma-separated values' do
      context 'and both values are valid numbers' do
        it 'returns the sum of the two numbers' do
          expect(StringCalculator.add('3,5')).to eq(8)
        end
      end

      context 'and both values are invalid' do
        it 'returns 0' do
          expect(StringCalculator.add('a,b')).to eq(0)
        end
      end

      context 'and one of the value is an invalid number' do
        it 'treats the invalid number as 0 and returns the sum of valid numbers' do
          expect(StringCalculator.add('3,a')).to eq(3)
        end
      end
    end

    context 'when the input is a string with more than two comma-separated values' do
      context 'and all the values are valid numbers' do
        it 'returns the sum of numbers' do
          expect(StringCalculator.add('1,2,3,4')).to eq(10)
        end
      end

      context 'and any of the value or all the values are invalid numbers' do
        it 'treats the invalid number as 0 and returns the sum' do
          expect(StringCalculator.add('1,a,b,4')).to eq(5)
        end
      end
    end

    context 'when the input is a string with delimiters' do
      context 'and the string contains a newline delimiter' do
        it 'ignores the newline delimiter and returns the sum of the values' do
          expect(StringCalculator.add("4\n2,3")).to eq(9)
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
