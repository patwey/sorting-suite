module SortingSuite
  class BubbleSort
    attr_reader :unsorted

    def initialize(unsorted)
      @unsorted = unsorted
    end

    def swap!(p_idx, p_ele, c_idx, c_ele)
      unsorted[p_idx] = c_ele
      unsorted[c_idx] = p_ele
    end

    def pass!(comparisons, prev_idx, current_idx)
      1.upto comparisons do
        prev_element = unsorted[prev_idx]
        current_element = unsorted[current_idx]

        if prev_element > current_element
          swap!(prev_idx, prev_element, current_idx, current_element)
        end

        comparisons -= 1
        prev_idx += 1
        current_idx += 1
      end
    end

    def sort
      0.upto unsorted.count - 1 do
        comparisons = unsorted.count - 1
        prev_idx = 0
        current_idx = 1

        pass!(comparisons, prev_idx, current_idx)
      end
      unsorted
    end
  end
end
