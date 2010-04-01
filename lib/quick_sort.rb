module QuickSort
  def sort(to_sort)
    return to_sort if to_sort.size <= 1
    pivot = rand to_sort.size
    pivot_value = to_sort[pivot]

    left = []
    right = []

    to_sort.each_with_index do |value, index|
      next if index == pivot

      if (value <=> pivot_value) <= 0
        left.push value
      else
        right.push value
      end
    end

    sort(left).concat([pivot_value]).concat(sort(right))
  end
end
