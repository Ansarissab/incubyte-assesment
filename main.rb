def StringCalculator(string_numbers)
  string_numbers.gsub("\n", "").split(",").map(&:to_i).sum
end
