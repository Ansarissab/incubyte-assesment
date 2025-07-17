require 'rspec'
require_relative 'main'

RSpec.describe 'StringCalculator' do

  describe 'when given comma-separated numbers' do
    it 'should return the sum of comma-separated numbers' do
      expect(StringCalculator("1,2,3")).to eq(6)
    end
  end
end
