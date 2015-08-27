require 'pry'

class BubbleSort
  def initialize(array)
    @array = array
    @previous = array.first
    @current_index = 1
    @current = array[@current_index]
  end

  def get_array
    @array
  end

  def get_previous
    @previous
  end

  def get_current_index
    @current_index
  end

  def get_current
    @current
  end

  def swap!(array, current_index)
    previous_index = current_index - 1
    current = array.slice!(current_index)
    array.insert(previous_index, current)
    array
  end



  def sort
    array = get_array
    current_index = get_current_index
    current = get_current
    previous = get_previous
    array.count.times do
      loop do
        current = array[current_index]
        previous = array[current_index - 1]
        if current < previous
          array = swap!(array, current_index)
        end
        current_index += 1
        current = array[current_index]
        previous = array[current_index - 1]
        break unless current_index < array.count
      end
      current_index = 1
    end
    array
  end
end
