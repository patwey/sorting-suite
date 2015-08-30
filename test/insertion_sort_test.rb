require 'minitest'
require 'insertion_sort'

class InsertionSortTest < Minitest::Test
  def test_it_initializes_unsorted_to_array_passed_in
    assert_equal ['c', 'b', 'a'], SortingSuite::InsertionSort.new(['c', 'b', 'a']).unsorted
  end

  def test_it_initializes_sorted_as_an_empty_array
    assert_equal [], SortingSuite::InsertionSort.new(['c', 'b', 'a']).sorted
  end

  def test_empty_shovels_number_into_sorted_if_sorted_is_empty
    insertion_sort = SortingSuite::InsertionSort.new(['c', 'b', 'a'])
    assert_equal [], insertion_sort.sorted
    assert_equal ['z'], insertion_sort.empty!('z')
  end

  def test_smallest_unshifts_number_into_sorted_if_its_smaller_than_first_sorted_element
    insertion_sort = SortingSuite::InsertionSort.new(['c', 'b', 'a'])
    insertion_sort.sorted[0] = 'z'
    assert_equal ['a', 'z'], insertion_sort.smallest!('a')
  end

  def test_largest_pushes_number_into_sorted_if_its_larger_than_last_sorted_element
    insertion_sort = SortingSuite::InsertionSort.new([])
    insertion_sort.sorted[0] = 'b'
    assert_equal ['b', 'z'], insertion_sort.largest!('z')
  end

  def test_insert_before_larger_inserts_number_into_index_of_larger_sorted_element
    insertion_sort = SortingSuite::InsertionSort.new([])
    insertion_sort.sorted << 'a'
    insertion_sort.sorted << 'c'
    insertion_sort.insert_before_larger!('b')
    assert_equal ['a', 'b', 'c'], insertion_sort.sorted
  end

  def test_sort_fills_sorted_with_unsorted_arranged_in_ascending_order
    assert_equal ['a', 'b', 'c', 'd'], SortingSuite::InsertionSort.new(['d', 'b', 'a', 'c']).sort
  end
end
