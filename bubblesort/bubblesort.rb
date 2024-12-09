

def bubblesort (arr) 

c = arr.length

while c >= 0 do
  switcha = 0
  switchb = 0
  a = 0
  b = 1
  while a < c && b < c do
    if arr[a] > arr[b]
      switcha = arr[a]
      switchb = arr[b]
      arr[a] = switchb
      arr[b] = switcha
    end
  a += 1
  b += 1
  end
  c -= 1
end 

p arr

end

bubblesort([4,3,78,2,0,2])
