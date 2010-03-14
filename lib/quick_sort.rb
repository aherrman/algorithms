module QuickSort
  def sort(toSort)
    return toSort if toSort.size <= 1
    pivot = rand toSort.size
    pivotValue = toSort[pivot]

    left = []
    right = []

    toSort.each_with_index do |value, index|
      next if index == pivot

      if (value <=> pivotValue) <= 0
        left.push value
      else
        right.push value
      end
    end

    sort(left).concat([pivotValue]).concat(sort(right))
  end
end
