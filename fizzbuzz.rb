### FIZZBUZZ
def fizzbuzz(limit)
  i = 0
  until i == limit do
    i += 1
    puts "#{i.to_s} #{i % 3 == 0 ? "Fizz" : ''}#{i % 5 == 0 ? "Buzz" : ''}\n"
  end
end

def fizzbuzz_one_line(limit)
  (1..limit).each { |i| puts "#{i.to_s} #{i % 3 == 0 ? "Fizz" : ''}#{i % 5 == 0 ? "Buzz" : ''}\n" }
end

# fizzbuzz(20)
fizzbuzz_one_line(20)
