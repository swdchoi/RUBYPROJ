class Node
  def initialize (key, value, nextnode = nil)
    @key = key
    @value = value
    @next = nextnode
  end

  def setval(val)
    @value = val
  end

  def value
    @value
  end

  def key 
    @key
  end

  def next
    @next
  end

  def setnextnode(node)
    @next = node
  end
end

class Hashmap

@@length = 0

  def initialize 
    @loadfactor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def set(key, value)
    if @@length >= @capcity * @loadfactor
      resize
    end
    
    index = hash(key) % @capacity
    current = @buckets[index]

    if current == nil
      @buckets[index] = Node.new(key, value)
      @@length += 1
      return
    end

    while current != nil
      if current.key == key
        current.setval(value)
        return
      end
      current = current.next
    end
    node = Node.new(key, value)
    @buckets[index].setnextnode(node)
    @@length += 1
  end

  def resize
    newcap = @capacity * 2
    newbuck = Array.new(newcap)

    @buckets.each do |buck|
      current = buck
      while current != nil
        index = hash(current.key) % newcap
        new_node = Node.new(current.key, current.value, newbuck[index])
        newbuck[index] = new_node
        current = current.next
      end
    end
  end

  def get(key)
    index = hash(key) % @capacity
    current = @buckets[index]
  
    while current != nil
      if current.key == key
        return current.value
      end
      current = current.next
    end
    return nil
  end

  def has?(key)
    index = hash(key) % @capacity
    current = @buckets[index]
  
    while current != nil
      if current.key == key
        return true
      end
      current = current.next
    end
    return nil
  end

  def remove(key)
    index = hash(key) % @capacity
    current = @buckets[index]
    while current != nil
      if current.next.key == key
        current.setnextnode(current.next.next)
        current.next.key = nil
        current.next.value = nil
        current.next.next = nil
      end
      current = current.next
    end
    return nil
  end

  def length
    return @@length
  end

  def clear
    @buckets.clear
    @buckets = Array.new(@capacity)
  end

  def keys
    keyarr = []
    @buckets.each do |num|
    current = num
      while current != nil
      keyarr.push(current.key)
      current = current.next
      end
    end
  return keyarr
  end

  def values
    valarr = []
    @buckets.each do |num|
      current = num
      while current != nil
        valarr.push(current.value)
        current = current.next
      end
    end
    return valarr
  end

  def entries
    keyvalarr = []
    @buckets.each do |num|
      current = num
      while current != nil
        keyvalarr.push([current.key, current.value])
        current = current.next
      end
    end
    return keyvalarr
  end

  def buckets
    @buckets
  end
end

test = Hashmap.new
test.set('apple', 'red')
 test.set('banana', 'yellow')
 test.set('carrot', 'orange')
 test.set('dog', 'brown')
 test.set('elephant', 'gray')
 test.set('frog', 'green')
 test.set('grape', 'purple')
 test.set('hat', 'black')
 test.set('ice cream', 'white')
 test.set('jacket', 'blue')
 test.set('kite', 'pink')
 test.set('lion', 'golden')

puts test.has?('lion')
