# Unit tests for MergeSort

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'in_place_merge_sort'

class IPMSTest
  extend InPlaceMergeSort
end

class InPlaceMergeSortTest < Test::Unit::TestCase
  def test_sort
    unsorted = [6, 3, 8, 4, 5, 0, 2, 9, 7, 1]

    sorted = IPMSTest.sort unsorted
    expected = unsorted.sort

    assert_equal expected, sorted
    assert expected.equal? sorted
  end

  def test_sort_does_not_change_input
    unsorted = [6, 3, 8, 4, 5, 0, 2, 9, 7, 1]

    sorted = IPMSTest.sort unsorted

    assert_equal unsorted, sorted
  end
end
