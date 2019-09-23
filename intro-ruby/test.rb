def bigger(a,b)
  if a>b
    a
  else
    b
  end
end

def smaller(a,b)
  if a<b
    a
  else
    b
  end
end

def median(a,b,c)
 candidate=[a,b,c]

 candidate_bigger = bigger(a,b)
 biggest = bigger(candidate_bigger,c)
 candidate_smaller = smaller(a,b)
 smallest = smaller(candidate_smaller,c)

 candidate.delete(biggest)
 candidate.delete(smallest)
 candidate
end

puts(median(5,7,2))
puts(median(7,3,2))
puts(median(1,4,2))

def median2(a,b,c)
 if a > b
   if a > c
     if b > c
       b
     else
       c
     end
   else
     a
   end
 else
   if b > c
    if a > c
         a
       else
         c
    end
  else
    b
  end
 end
end
