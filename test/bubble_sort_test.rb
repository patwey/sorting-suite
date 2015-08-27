require 'minitest'
require 'bubble_sort'

class BubbleSortTest < Minitest::Test
  def test_it_sets_previous_to_first_element_initially
    bubble = BubbleSort.new([0, 1, 2])
    assert_equal 0, bubble.get_previous
  end

  def test_it_sets_current_to_second_element_initially
    bubble = BubbleSort.new([0, 1, 2])
    assert_equal 1, bubble.get_current
  end

  def test_it_initializes_current_index_at_one
    bubble = BubbleSort.new([0, 1, 2])
    assert = 1, bubble.get_current_index
  end

  def test_swap_method_moves_current_element_in_front_of_previous_element
    array = [2, 1]
    bubble = BubbleSort.new(array)
    current_index = bubble.get_current_index
    bubble.swap!(array, current_index)
    assert_equal 1, array[0]
    assert_equal 2, array[1]
  end

  def test_sort_method_swaps_current_element_with_previous_element_if_it_is_smaller
    array = [2, 1]
    bubble = BubbleSort.new(array)
    array = bubble.sort
    assert_equal [1, 2], array
  end

  def test_sort_method_sorts_array_in_ascending_order
    array = [4, 2, 0, 3, 1]
    assert_equal [0, 1, 2, 3, 4], BubbleSort.new(array).sort
  end
end
