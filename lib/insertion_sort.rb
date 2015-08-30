require 'pry'

module SortingSuite
  class InsertionSort
    attr_reader :unsorted, :sorted

    def initialize(unsorted)
      @unsorted = unsorted
      @sorted = []
    end

    def empty!(unsorted_num)
        sorted << unsorted_num
    end

    def smallest!(unsorted_num)
        sorted.unshift(unsorted_num)
    end

    def largest!(unsorted_num)
        sorted.push(unsorted_num)
    end

    def insert_before_larger!(unsorted_num)
      sorted.each_with_index do |sorted_num, sorted_idx|
        sorted_num
        if sorted_num > unsorted_num
          sorted.insert(sorted_idx, unsorted_num)
          break
        end
      end
    end

    def sort
      unsorted.each do |unsorted_num|
        if sorted.empty?
          empty!(unsorted_num)
        elsif sorted.first > unsorted_num
          smallest!(unsorted_num)
        elsif unsorted_num > sorted.last
          largest!(unsorted_num)
        else insert_before_larger!(unsorted_num)
        end
      end
      sorted
    end
  end
end

SortingSuite::InsertionSort.new([5, 1, 3, 2, 8, 4, 10]).sort
