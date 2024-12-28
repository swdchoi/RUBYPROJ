


def fibiter (n)
  newarr = [0, 1, 1]

  if n < 2 
    if n == 0
      return [0]
    end
    
    if n == 1
      return [0, 1]
    end
  else 
      i = 2
      while i < n do
        newarr << newarr[i] + newarr[i - 1]
        i += 1
      end
    return newarr
  end
end

def fibonacci(n)
  if n < 1
    return []
  else
    arr = fibonacci(n-1)
    if arr.length < 2
      arr << arr.length
    else
      arr << arr[-1] + arr[-2]
    end
  end
  arr
end

#puts fibonacci(8)

arr = [3,2,1,13,8,5,0,29]

def mergesort (arr)
  new_arr = []
  n = arr.length
  if arr.length <= 1
    return arr
  else
    firsthalf = mergesort(arr[0, n/2])
    secondhalf = mergesort(arr[n/2, n])
    until firsthalf.empty? || secondhalf.empty?
      if firsthalf[0] < secondhalf[0]
      
        new_arr << firsthalf.shift
      else
        new_arr << secondhalf.shift
      end
    end
  end

  new_arr += firsthalf + secondhalf
  new_arr
end

#puts mergesort(arr)
#


def merge(arr)
  newarr = []
  n = arr.length

  if arr.length <= 1
    return arr
  else
    leftside = merge(arr[0, n/2])
    rightside = merge(arr[n/2, n])

    until leftside.empty? || rightside.empty?
      if leftside[0] < rightside[0]
        newarr << leftside.shift
      else
        newarr << rightside.shift
      end
    end
  end
  newarr += rightside + leftside
  newarr
end

puts merge(arr)