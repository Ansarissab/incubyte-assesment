def StringCalculator(string_numbers)
  delimiter = string_numbers.start_with?("//") ? string_numbers[2] : ","

  numbers = string_numbers.split("//#{delimiter}\n").last
  numbers = numbers.split(delimiter).map(&:to_i)

  if numbers.any?(&:negative?)
    return "Negative numbers are not allowed: #{numbers.select(&:negative?).join(", ")}"
  else
    return numbers.sum
  end
end
