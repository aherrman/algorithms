module InPlaceQuickSort
  def sort(to_sort)
    sort_in_place(to_sort, 0, to_sort.size - 1)
  end

private
  def sort_in_place(to_sort, left, right)
    return to_sort unless right - left >= 1
    pivot = left + rand(right - left)
    pivot_value = to_sort[pivot]

    swap(to_sort, pivot, right)

    curr_index = left
    (left...right).each do |i|
      value = to_sort[i]
      if (value <=> pivot_value) < 0
        swap(to_sort, curr_index, i)
        curr_index = curr_index + 1
      end
    end

    swap(to_sort, curr_index, right)

    sort_in_place(to_sort, left, curr_index - 1)
    sort_in_place(to_sort, curr_index + 1, right)

    to_sort
  end

  def swap(array, index1, index2)
    return if index1 == index2
    tmp = array[index1]
    array[index1] = array[index2]
    array[index2] = tmp
  end
end
