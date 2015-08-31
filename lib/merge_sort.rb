module SortingSuite
  class MergeSort
    attr_reader :unsorted

    def initialize(unsorted)
      @unsorted = unsorted
    end

    def split_to_pairs(array)
      nested = []
      array.each_with_index do |n, idx|
        if array.count.even?
          if array[idx + 1].nil?
            break
          elsif idx.even?
            nested << [n] + [array[idx + 1]]
          end
        else
          if n == array.last
            nested << [n]
            break
          elsif idx.even?
            nested << [n] + [array[idx + 1]]
          end
        end
      end
      nested
    end

    def order_pairs(nested)
      nested.each do |array|
        array.each_with_index do |number, idx|
          if array[idx + 1]
            if number > array[idx + 1]
              number = array.shift
              array << number
            end
          end
        end
      end
      nested
    end

    def sort
      return [] if unsorted == []
      nested = split_to_pairs(unsorted)
      nested = order_pairs(nested)
      sorted = []

      nested.each_with_index do |array, index|
        if array.count == 1
          if array[0] < nested[index - 1].first
            array.concat nested[index - 1]
            nested.delete_at index - 1
          elsif nested[index - 1].last < array[0]
            nested[index - 1] << array[0]
            nested.delete_at index
          else
            nested[index - 1].insert(1, array[0])
            nested.delete_at index
          end
        end
      end

      loop do
        if nested[0].nil? || nested[0].empty?
          if nested[1][0]
            sorted << nested[1][0]
            nested[1].delete_at 0
          else
            break
          end
        elsif nested[1].nil? || nested[1].empty?
          if nested[0][0]
            sorted << nested[0][0]
            nested[0].delete_at 0
          else
            break
          end
        else
          if nested[0][0] < nested[1][0]
            sorted << nested[0][0]
            nested[0].delete_at 0
          elsif nested[1][0] < nested[0][0]
            sorted << nested[1][0]
            nested[1].delete_at 0
          end
        end
        break if (nested[0].empty? || nested[0].nil?) &&
                 (nested[0].empty? || nested[1].nil?)
      end
      sorted
    end
  end
end

SortingSuite::MergeSort.new([]).sort
SortingSuite::MergeSort.new([3, 2, 1]).sort
SortingSuite::MergeSort.new([5, 3, 1, 2, 4]).sort
