def substrings(str_input, dictionary)
  unless str_input.is_a?(String) and dictionary.is_a?(Array)
    raise TypeError("Invalid type provided")
  end

  result = {}

  all_words = str_input.downcase.gsub(/[^0-9a-z ]/i, '').split(" ")

  dictionary.each do |key|
    all_words.each do |word|
      if word.include?(key.downcase)
        result[key] = result.has_key?(key) ? result[key] + 1 : 1
      end
    end
  end

  result
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

print substrings("Howdy partner, sit down! How's it going?", dictionary)
