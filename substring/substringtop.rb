
directory = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substring (sentence, directoryarr)
  
sentarr = sentence.downcase!
finalarr = [];
directoryarr.each{|letter|letter.downcase}

directoryarr.each{ |letter|
  if sentarr.include?(letter)
    count = sentarr.scan(/#{letter}/)
    finalarr.push(count)
  end
}

finalfinalarr =  finalarr.flatten.reduce(Hash.new(0)) do |hash, let|
    hash[let] += 1
    hash
end

p finalfinalarr

end

substring("Howdy partner, sit down! How's it going?", directory);