# frozen_string_literal: true

require 'rspec'
require './lib/string_calculator'

RSpec.describe 'StringCalculator' do
  describe '.add' do
    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end
  end
end
