require 'in_place_quick_sort'

class IPQSTest
  extend InPlaceQuickSort
end

unsorted = [6, 3, 8, 4, 5, 0, 2, 9, 7, 1]

IPQSTest.sort unsorted

print "sorted #{unsorted}\n"