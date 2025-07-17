require 'rspec'
require_relative 'main'

RSpec.describe 'StringCalculator' do

  describe 'when given comma-separated numbers' do
    it 'should return the sum of comma-separated numbers' do
      expect(StringCalculator("1,2,3")).to eq(6)
    end
  end

  describe 'handle new lines between numbers' do
    it 'should return the sum of comma-separated numbers with new line character' do
      expect(StringCalculator("1\n,2,3")).to eq(6)
    end
  end

  describe 'support different delimiters' do
    it 'should return the sum of string numbers with semi-colon delimiter' do
      expect(StringCalculator("//;\n1;2;3")).to eq(6)
    end

    it 'should return the sum of string numbers with comma delimiter' do
      expect(StringCalculator("//,\n1,2,3")).to eq(6)
    end

    it 'should return the sum of string numbers with $ delimiter' do
      expect(StringCalculator("//$\n1$2$3")).to eq(6)
    end
  end

end
