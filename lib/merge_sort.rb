module MergeSort
  def sort(to_sort)
    return to_sort if to_sort.size <= 1

    mid = to_sort.size/2

    left = sort(to_sort[0, mid])
    right = sort(to_sort[mid, to_sort.size])

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
