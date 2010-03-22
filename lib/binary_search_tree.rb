class BinarySearchTree
  include Enumerable

  attr_reader :size

  def initialize
    @size = 0
    @root = nil
  end

  def add!(key, value)
    @root = add_to(@root, key, value)
  end

  def get(key)
    get_from(@root, key)
  end

  def remove!(key)
    out = {}
    @root = remove_from(@root, key, out)
    @size = @size - 1 unless out[:value].nil?
    out[:value]
  end

  def each
    each_in_order { |n| yield n[:value] }
  end

  def each_in_order(&block)
    each_in_order_from(@root, &block)
  end

private
  class TreeNode
    attr_accessor :key, :value, :left, :right
    def initialize(key, value, left=nil, right=nil)
      @key = key
      @value = value
      @left = left
      @right = right
    end
  end

  # Adds a new node to the given subtree.  Returns the new root.
  def add_to(root, key, value)
    if root.nil?
      @size = @size + 1
      root = TreeNode.new(key, value, nil, nil)
    elsif key == root.key
      root.value = value
    elsif (key <=> root.key) < 0
      root.left = add_to(root.left, key, value)
    else
      root.right = add_to(root.right, key, value)
    end

    root
  end

  # Searches for a node with the given root from the subtree.  Returns the
  # value.
  def get_from(root, key)
    if root.nil?
      nil
    elsif root.key == key
      root.value
    elsif (key <=> root.key) < 0
      get_from(root.left, key)
    else
      get_from(root.right, key)
    end
  end

  # Searches for and removes the node with the given key from the given
  # subtree.  Returns the new root and places the found value in the :value
  # property in the out hash.
  def remove_from(root, key, out)
    if root.nil?
      out[:value] = nil
    elsif root.key == key
      out[:value] = root.value
      root = remove_root(root)
    elsif (key <=> root.key) < 0
      root.left = remove_from(root.left, key, out)
    else
      root.right = remove_from(root.right, key, out)
    end

    root
  end

  # Removes the root node of the given subtree.  Returns the new root
  def remove_root(root)
    if root.nil?
      nil
    elsif root.left.nil? && root.right.nil?
      nil
    elsif root.left.nil?
      root.right
    elsif root.right.nil?
      root.left
    else
      out = {}
      root.left = remove_rightmost(root.left, out)
      new_root = out[:value]
      new_root.left = root.left
      new_root.right = root.right
      new_root
    end
  end

  def remove_rightmost(root, out)
    if root.nil?
      out[:value] = nil
      root = nil
    elsif root.right.nil?
      out[:value] = root
      root = root.left
    else
      root.right = remove_rightmost(root.right, out)
    end

    root
  end

  def each_in_order_from(root, &block)
    return if root.nil?

    each_in_order_from(root.left, &block)
    block.call({ :key => root.key, :value => root.value })
    each_in_order_from(root.right, &block)
  end
end
