
def stockPicker (arr)

i = 0
allCase = []

  while i < arr.length do
    a = i + 1
    hihi = []
    while a < arr.length do
      hihi.push(arr[a] - arr[i])
      a += 1 
    end
  allCase[i] = hihi
  i += 1
  end

  maxnum = allCase.flatten.max

  p maxnum
  p allCase

  z = 0
  ans = []

  while z < allCase.length
    k = 0
    while k < allCase[z].length
      if allCase[z][k] == maxnum
        ans.push(z, k + z + 1)
      end
      k += 1
    end
    z+=1
  end

p ans;


end

stockPicker([17,3,6,9,8,10,12,15])