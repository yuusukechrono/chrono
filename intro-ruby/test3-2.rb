def check_three()
  for i in 1..40
    if i % 3 == 0
      puts("Hoge")
    elsif i.to_s.include?("3")
      puts("Hoge")
    else
      puts(i)
    end
  end
end

puts(check_three())
