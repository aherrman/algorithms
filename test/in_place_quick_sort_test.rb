# Unit tests for MergeSort

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'in_place_quick_sort'

class IPQSTest
  extend InPlaceQuickSort
end

class InPlaceQuickSortTest < Test::Unit::TestCase
  def test_sort
    srand 0 # Force a random seed known to trigger failue
    unsorted = [6, 3, 8, 4, 5, 0, 2, 9, 7, 1]

    sorted = IPQSTest.sort unsorted
    expected = unsorted.sort

    assert_equal expected, sorted
  end

  def test_sort_changes_input
    unsorted = [6, 3, 8, 4, 5, 0, 2, 9, 7, 1]

    sorted = IPQSTest.sort unsorted

    assert sorted.equal? unsorted
  end
end
