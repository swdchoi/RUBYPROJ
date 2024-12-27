module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |value|
      if yield(value) == false 
        return false
      end
    end
    return true
  end

  def my_any?
    self.my_each do |value|
      if yield(value) == true
        return true
      end
    end
    return false
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |value|
        if yield(value) == true
          count = count + 1
        end
      end
      return count 
    end
    return self.size
  end

  def my_each_with_index
    index = 0
    self.my_each do |value|
      yield(value, index)
      index += 1
    end
  end

  def my_inject (initial)
    prod = initial
    self.my_each do |value|
      prod = yield(prod, value)
    end
    return prod
  end

  def my_map
    newself = []
    self.my_each do |value|
     newself << yield(value)
    end
    return newself
  end

  def my_none?
    self.my_each do |value|
      if (yield(value) == true)
        return false
      end
    end
    return true
  end

  def my_select
    newarr = []
    self.my_each do |value|
      if (yield(value) == true)
        newarr << value
      end
    end
    return newarr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end
