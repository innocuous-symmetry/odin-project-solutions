### CAESAR CIPHER
Alphabet = 'abcdefghijklmnopqrstuvwxyz'

def caesar_cipher(input, shift)
  unless shift.is_a? Numeric and input.is_a? String
    raise TypeError("Receive invalid input")
  end

  input.downcase!

  array_from_input = Array.new(input.length)
  result = ''
  for i in 0..(input.length - 1)
    start = Alphabet.index(input[i])
    after_shift = start ? Alphabet[(start + shift % 26)] : -1
    result += after_shift == -1 ? input[i] : Alphabet[after_shift]
  end

  result
end

print caesar_cipher("Doing stuff with Ruby", 5)
