class StringCalculator
  def add(input)
    return 0 if input.empty?
    delimiter = input.start_with?("//") ? input[2] : ","

    numbers = input.split("//#{delimiter}\n").last
    numbers = numbers.gsub("\n", delimiter) if numbers.include?("\n")
    numbers = numbers.split(delimiter).map(&:to_i)

    if numbers.any?(&:negative?)
      raise ArgumentError, "Negative numbers are not allowed: #{numbers.select(&:negative?).join(", ")}"
    else
      return numbers.sum
    end
  end
end
