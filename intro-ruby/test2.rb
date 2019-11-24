num = [1,2,3,4,5,6,7,8,9,10]

num.each do |content|
puts content
end

10.times do
  puts "hello"
end

for num in 1..10
  puts "goodbye"
end

i=0
while i<=10 do
  puts "goodafternoon"
  i+=1
end

def addition(x,y,z)
 (x+y+z)/3
end

puts(addition(2,3,7))

def division(x,y)
  x/y
end

puts(division(10,5))

def doing(date, place, food)
 "#{date}は#{place}で#{food}を食べる"
end

puts(doing("今日","渋谷","カレー"))
puts(doing("明日","池袋","オムライス"))
