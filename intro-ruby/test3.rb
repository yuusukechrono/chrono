sample_word = "abcdefg"

def count_length(mozi)
  count = 0
  mozi.split("").each do
  count += 1
  end
  count
end

p count_length(sample_word)

def repeat_string(str)
  if str.length < 5
    puts str*3
  else
    str = str.slice(0..3)
    puts str*3
  end
end

repeat_string("Python")
repeat_string("Go")
repeat_string("C++")


def switch_letter(origin_str)
  change_str=[]
  strs= origin_str.split("")
  strs.each do |str|
    if str == str.upcase
      change_str << str.downcase
    else
      change_str << str.upcase
    end
  end
  return change_str.join
end

puts switch_letter("abCD")
puts switch_letter("EEEE")
puts switch_letter("ffff")
