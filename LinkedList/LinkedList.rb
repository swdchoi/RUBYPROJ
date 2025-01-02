class Node
  def initialize (value = nil, nextnode = nil)
    @value = value
    @next = nextnode
  end

  def value 
    @value
  end

  def next_node (nodeval)
    @next = nodeval
  end

  def next
    @next
  end

end

class LinkedList

@head = nil
@tail = nil

  def append(value)
    node = Node.new(value)

    if @head == nil 
      @head = node
      @tail = node
      return
    end

    @tail.next_node(node)
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)

    if @head == nil 
      @head = node
      @tail = node
      return
    end

    node.next_node(@head)
    @head = node
  end

  def size
    count = 0
    current = @head
    until current == nil do
      current = current.next
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current = @head
    count = index

    while count >= 0 
      current = current.next
      count -= 1
    end

    current.value
  end

  def pop
    current = @head

    if @head == @tail
      @head = nil
      @tail = nil
      return
    end
    
    until current.next == @tail do
      current = current.next
    end

    current.next_node(nil)
    @tail = current
  end

  def contains?(value)
    current = @head
    until current == nil do
      if current.value == value
        return true
      end
      current = current.next
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    until current == nil do
      current = current.next
      if current.value == value
        return index
      end
      index += 1
    end
    false
  end

  def to_s
    current = @head
    str = ""
    until current == nil do
      str += " (#{current.value}) ->"
      current = current.next
    end
    str += " (nil)"
    str
  end
end

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.prepend('turtle')

puts list.find('parrot')
puts list.at(2)
puts list.contains?('parrot')


