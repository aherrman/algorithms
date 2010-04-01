module InPlaceQuickSort
  def sort(toSort)
    sort_in_place(toSort, 0, toSort.size - 1)
  end

private
  def sort_in_place(toSort, left, right)
    return toSort unless right - left >= 1
    pivot = left + rand(right - left)
    pivotValue = toSort[pivot]

    swap(toSort, pivot, right)

    currIndex = left
    (left...right).each do |i|
      value = toSort[i]
      if (value <=> pivotValue) < 0
        swap(toSort, currIndex, i)
        currIndex = currIndex + 1
      end
    end

    swap(toSort, currIndex, right)

    sort_in_place(toSort, left, currIndex - 1)
    sort_in_place(toSort, currIndex + 1, right)

    toSort
  end

  def swap(array, index1, index2)
    return if index1 == index2
    tmp = array[index1]
    array[index1] = array[index2]
    array[index2] = tmp
  end
end
