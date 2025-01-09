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
  end
end
# rubocop:enable Metrics/BlockLength
