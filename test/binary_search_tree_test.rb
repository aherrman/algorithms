$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'binary_search_tree'

class BinarySearchTreeTest < Test::Unit::TestCase
  def test_add_and_get
    bst = BinarySearchTree.new

    bst.add! 3, "three"
    bst.add! 1, "one"
    bst.add! 2, "two"
    bst.add! 5, "five"

    assert_equal "two", bst.get(2)
    assert_equal "five", bst.get(5)
  end

  def test_each
    # to_a from Enumerable uses each so it's a nice simple way to test
    bst = build_bst 3, 1, 2, 5

    values = bst.to_a
    expected = [1, 2, 3, 5]
    assert_equal expected, values
  end

  def test_add_increments_size
    bst = BinarySearchTree.new

    assert_equal 0, bst.size

    bst.add! 2, "two"
    bst.add! 1, "one"
    bst.add! 3, "three"

    assert_equal 3, bst.size
  end

  def test_remove_leaf
    bst = build_bst 2, 1, 3

    value = bst.remove! 3

    assert_equal 3, value
    assert_nil bst.get(3)
    assert_equal [1, 2], bst.to_a
  end

  def test_remove_left_only
    bst = build_bst 3, 2, 1

    bst.remove! 2

    assert_equal [1, 3], bst.to_a
  end

  def test_remove_right_only
    bst = build_bst 1, 2, 3

    bst.remove! 2

    assert_equal [1, 3], bst.to_a
  end

  def test_remove_decrements_size
    bst = build_bst 2, 1, 3

    bst.remove! 2

    assert_equal 2, bst.size
  end

  def test_remove_middle
    bst = build_bst 10, 2, 11, 1, 6, 4, 8, 3, 5, 7, 9

    bst.remove! 6

    assert_equal [1, 2, 3, 4, 5, 7, 8, 9, 10, 11], bst.to_a
  end

  def test_adding_existing_key_doesnt_change_size
    bst = build_bst 2, 1, 3

    bst.add! 2, "dos"

    assert_equal 3, bst.size
  end

  def test_removing_non_existant_doesnt_change_size
    bst = build_bst 2, 1, 3

    bst.remove! 6

    assert_equal 3, bst.size
  end

  def build_bst(*values)
    bst = BinarySearchTree.new
    values.each { |v|
      bst.add! v, v
    }
    bst
  end
end
