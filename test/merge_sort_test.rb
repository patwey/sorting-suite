require 'minitest'
require 'merge_sort'

class MergeSortTest < Minitest::Test
  def test_it_initializes_unsorted_to_array_passed_in
    assert_equal [1, 2], SortingSuite::MergeSort.new([1, 2]).unsorted
  end

  def test_split_to_pairs_creates_nested_pairs
    merge_sort = SortingSuite::MergeSort.new([])
    assert_equal [[3, 2], [1]], merge_sort.split_to_pairs([3, 2, 1])
  end

  def test_order_pairs_arranges_each_nested_pair_in_ascending_order
    merge_sort = SortingSuite::MergeSort.new([])
    assert_equal [[2, 3], [1]], merge_sort.order_pairs([[3, 2], [1]])
  end

  def test_sort_method_returns_sorted_one_dimensional_arrays_when_given_the_code_snippets
    assert_equal [1, 2, 3], SortingSuite::MergeSort.new([3, 2, 1]).sort
    expected = [1, 2, 3, 4, 5]
    result = SortingSuite::MergeSort.new([5, 3, 1, 2, 4]).sort
    assert_equal expected, result
  end

  def test_sort_works_with_pre_sorted_arrays
    assert_equal [1, 2, 3], SortingSuite::MergeSort.new([1, 2, 3]).sort
  end

  def test_sort_works_with_empty_arrays
    assert_equal [], SortingSuite::MergeSort.new([]).sort
  end

  def test_sort_method_works_when_given_string_arrays_comparable_to_the_code_snippets
    assert_equal ['a', 'b', 'c'], SortingSuite::MergeSort.new(['c', 'b', 'a']).sort
    assert_equal ['a', 'b', 'c', 'd', 'e'], SortingSuite::MergeSort.new(['e', 'c', 'a', 'b', 'd']).sort
  end
end
