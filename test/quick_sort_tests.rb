# Unit tests for MergeSort

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'quick_sort'

class QSTest
  extend QuickSort
end

class QuickSortTest < Test::Unit::TestCase
  def test_sort
    unsorted = [6, 3, 8, 4, 5, 0, 2, 9, 7, 1]

    sorted = QSTest.sort unsorted
    expected = unsorted.sort

    assert_equal expected, sorted
    assert_not_equal unsorted, sorted
  end

  def test_sort_does_not_change_input
    unsorted = [6, 3, 8, 4, 5, 0, 2, 9, 7, 1]

    sorted = QSTest.sort unsorted

    assert_not_equal unsorted, sorted
  end
end
