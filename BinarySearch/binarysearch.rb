class Node
  def initialize(data = nil, left = nil, right = nil)
    @left = left
    @right = right
    @data = data
  end

  def left
    @left
  end

  def right
    @right
  end

  def data
    @data
  end

  def right=(node)
    @right = node
  end

  def left=(node)
    @left = node
  end

  def data=(node)
    @data = node
  end
end

class Tree 
  def initialize(arr)
    @array = arr
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
      if arr.empty?
        return
      end

      root = Node.new(arr[arr.length/2])
      root.left = build_tree(arr[0...arr.length/2])
      root.right = build_tree(arr[arr.length/2 + 1..-1])
      
      root 
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insertval(node, val)
    if node == nil
      node = Node.new(val)
      return node
    end
    if val > node.data
      node.right = insertval(node.right, val)
    elsif val < node.data
      node.left = insertval(node.left, val)
    end
    node
  end

  def insert(val)
    @root = insertval(@root, val)
  end

  def deleteval(node, val)
    if node == nil
      return nil
    end
    puts node.data
    if val > node.data
      node.right = deleteval(node.right, val)
    elsif val < node.data
      node.left = deleteval(node.left, val)
    elsif node.data == val
      if node.right == nil && node.left == nil
        return nil
      elsif node.right == nil 
        return node.left
      elsif node.left == nil
        return node.right
      else
        current = node.right
        while current.left
          current = current.left
        end
        node.data = current.data
        node.right = deleteval(node.right, current.data)
      end
    end
    node
  end

  def delete (val)
    @root = deleteval(@root, val)
  end

  def find(val)
    current = @root
    while current
      if current.data < val
        current = current.right
      elsif current.data > val
        current = current.left
      elsif current.data == val
        return current
      end
    end
    nil
  end
  
  def level_order
    queue = []
    result = []
    current = @root
    queue << current

    while !queue.empty?
      current = queue.shift

      if block_given?
        yield current
      else
        result << current.data
      end

      queue << current.left if current.left
      queue << current.right if current.right
    end

    result unless block_given?
  end

  def inorder
    result = []

    def inordrecur (arr, current)
      if current == nil
        return
      end

      inordrecur(arr, current.left)
      arr << current.data
      inordrecur(arr, current.right)

      return arr
    end

    return inordrecur(result, @root)
  end

  def preorder
    result = []

    def preordercur (arr, current)
      if current == nil
        return
      end

      arr << current.data

      preordercur(arr, current.left)
      preordercur(arr, current.right)

      return arr
    end

    return preordercur(result, @root)
  end

  def postorder
    result = []

    def preordercur (arr, current)
      if current == nil
        return
      end

      preordercur(arr, current.left)
      preordercur(arr, current.right)
      arr << current.data

      return arr
    end
    return preordercur(result, @root)
  end

  def height (node)
    return -1 if node.nil? # Base case: height of a nil node is -1

    left_height = height(node.left)  # Recursively calculate left subtree height
    right_height = height(node.right) # Recursively calculate right subtree height
  
    [left_height, right_height].max + 1 # Height is max of both subtrees + 1
  end

  def depth(node)
    current = @root
    count = 0
    until current.data == node.data
      if node.data > current.data
        current = current.right
      elsif node.data < current.data
        current = current.left
      end
      count += 1
    end
    return count
  end

  def balanced?(current = @root, count = 0)
    if current == nil
      return true
    end
    
    leftcount = height(current.left)
    rightcount = height(current.right)

    difference = (leftcount - rightcount).abs

    if difference > 1
      return false
    end

    balanced?(current.left) && balanced?(current.right)
  end

  def rebalance
    orderedarr = self.inorder
    @root = build_tree(orderedarr)
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

tree.pretty_print
puts tree.balanced?
#tree.pretty_print
