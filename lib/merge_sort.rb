module MergeSort
  def sort(toSort)
    return toSort if toSort.size <= 1

    mid = toSort.size/2

    left = sort(toSort[0, mid])
    right = sort(toSort[mid, toSort.size])

    merge(left, right)
  end

private

  def merge(left, right)
    merged = []

    until(left.empty? && right.empty?)
      if left.empty?
        merged.push right.shift
      elsif right.empty?
        merged.push left.shift
      else
        if (left[0] <=> right[0]) <= 0
          merged.push left.shift
        else
          merged.push right.shift
        end
      end
    end

    merged
  end
end
