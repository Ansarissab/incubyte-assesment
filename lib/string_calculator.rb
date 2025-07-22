class StringCalculator
  def add(input)
    return 0 if input.empty?

    delimiter, number_string = extract_delimiter_and_numbers(input)
    numbers_string = normalize_newlines(number_string, delimiter)
    numbers = numbers_string.split(delimiter).map(&:to_i)

    negatives = numbers.select(&:negative?)
    raise ArgumentError, "Negative numbers are not allowed: #{negatives.join(", ")}" if negatives.any?

    numbers.sum
  end

  private

  def extract_delimiter_and_numbers(input)
    if input.start_with?("//")
      header, numbers = input.split("\n", 2)
      delimiter = header[2..]
      [delimiter, numbers]
    else
      [",", input]
    end
  end

  def normalize_newlines(input, delimiter)
    input.gsub("\n", delimiter)
  end
end
