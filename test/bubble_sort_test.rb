require 'minitest'
require 'bubble_sort'

class BubbleSortTest < Minitest::Test
  def test_initializes_unsorted_to_array_passed_in
    bubble_sort = SortingSuite::BubbleSort.new(['a', 'b'])
    assert_equal ['a', 'b'], bubble_sort.unsorted
  end

  def test_swap_switches_indicies_of_both_elements
    bubble_sort = SortingSuite::BubbleSort.new(['b', 'a'])
    bubble_sort.swap!(0, 'b', 1, 'a')
    assert_equal ['a', 'b'], bubble_sort.unsorted
  end

  def test_pass_moves_the_largest_element_to_the_leftmost_index
    bubble_sort = SortingSuite::BubbleSort.new(['z', 'a', 'b'])
    bubble_sort.pass!(2, 0, 1)
    assert_equal ['a', 'b', 'z'], bubble_sort.unsorted
  end

  def test_sort_works_with_arrays_of_strings
    assert_equal ['a', 'b', 'c'], SortingSuite::BubbleSort.new(['c', 'b', 'a']).sort
  end

  def test_sort_works_with_empty_arrays
    assert_equal [], SortingSuite::BubbleSort.new([]).sort
  end

  def test_sort_works_with_pre_sorted_arrays
    assert_equal [1, 2, 3], SortingSuite::BubbleSort.new([1, 2, 3]).sort
  end
end
