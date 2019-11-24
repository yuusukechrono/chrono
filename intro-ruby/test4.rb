
def FizzBuzz_number(i)
  list = i
  for n in list do
    if n % 15 == 0
      puts "FizZBuzz"
    elsif n % 5 == 0
      puts "Buzz"
    elsif n % 3 == 0
      puts "Fizz"
    else
      puts n
    end
  end
end

puts(FizzBuzz_number(gets.to_i))
