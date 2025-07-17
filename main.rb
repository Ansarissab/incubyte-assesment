def StringCalculator(string_numbers)
  string_numbers.split(",").map(&:to_i).sum
end
