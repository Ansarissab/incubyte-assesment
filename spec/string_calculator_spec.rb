require 'rspec'
require_relative '../lib/string_calculator.rb'

RSpec.describe 'StringCalculator' do
  subject(:calculator) { StringCalculator.new }

  describe 'when given an empty string' do
    it 'should return 0' do
      expect(calculator.add("")).to eq(0)
    end
  end

  describe 'when given comma-separated numbers' do
    it 'should return the sum of comma-separated numbers' do
      expect(calculator.add("1,2,3")).to eq(6)
    end
  end

  describe 'handle new lines between numbers' do
    it 'should return the sum of comma-separated numbers with new line character' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end
  end

  describe 'support different delimiters' do
    it 'should return the sum of string numbers with semi-colon delimiter' do
      expect(calculator.add("//;\n1;2;3")).to eq(6)
    end

    it 'should return the sum of string numbers with comma delimiter' do
      expect(calculator.add("//,\n1,2,3")).to eq(6)
    end

    it 'should return the sum of string numbers with $ delimiter' do
      expect(calculator.add("//$\n1$2$3")).to eq(6)
    end
  end

  describe 'exception on negative numbers' do
    it 'should return negative numbers not allowed for single negative number' do
      expect { calculator.add("1,2,-3") }.to raise_error(
        ArgumentError, "Negative numbers are not allowed: -3")
    end

    it 'should return negative numbers not allowed for single negative number' do
      expect { calculator.add("//;\n1;2;-3") }.to raise_error(
        ArgumentError, "Negative numbers are not allowed: -3")
    end

    it 'should return negative numbers not allowed for multiple number' do
      expect { calculator.add("//,\n1,2,-3,-4") }.to raise_error(
        ArgumentError, "Negative numbers are not allowed: -3, -4")
    end
  end
end
