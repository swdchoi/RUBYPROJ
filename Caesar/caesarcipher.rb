

def cipher (string , int)

  alphaarr = {}
  numberarr = {}

  i = 0
  ('a'..'z').each{|letter| 
  alphaarr[letter] = i
  i += 1
  }
  
  while i >= 0 do
    numberarr[i] = alphaarr.key(i)
    i -= 1
  end

numberarr.compact!()

stringarr =  string.split("")

stringarr.map!{|letter|
if letter == " " 
  letter
elsif alphaarr[letter].nil?
  letter
else
 alphaarr[letter] + int
end
}


stringarr.map!{|num| 
if num == " "
  num
elsif num.is_a?(String)
  num
elsif num > 25
    num -= 26
    numberarr[num]
else 
  numberarr[num]
end 
}

p stringarr

end

cipher("what a string!", 5)