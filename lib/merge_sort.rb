def split(array)
  nested = []                             # => []
  array.each_with_index do |n, idx|       # => [5, 3, 4, 5, 1, 2]
    if array.count % 2 == 0               # => true, true, true, true, true, true
      if array[idx + 1].nil?
        break
      elsif idx % 2 == 0
        nested << [n] + [array[idx + 1]]
      end
    else
      if n == array.last                  # =>
        nested << [n]                     # =>
        break
      elsif idx % 2 == 0                  # =>
        nested << [n] + [array[idx + 1]]  # =>
      end
    end
  end                                     # => nil
  nested                                  # => [[5, 3], [4, 5], [1, 2]]
end                                       # => :split

def sort(nested)
  nested.each_with_index do |array, idx|    # => [[5, 3], [4, 5], [1, 2]]
    array.each_with_index do |number, idx|  # => [5, 3], [4, 5], [1, 2]
      if array[idx + 1]                     # => 3, nil, 5, nil, 2, nil
        if number > array[idx + 1]          # => true, false, false
          number = array.shift              # => 5
          array << number                   # => [3, 5]
        end                                 # => [3, 5], nil, nil
      end                                   # => [3, 5], nil, nil, nil, nil, nil
    end                                     # => [3, 5], [4, 5], [1, 2]
  end                                       # => [[3, 5], [4, 5], [1, 2]]
  nested                                    # => [[3, 5], [4, 5], [1, 2]]
end                                         # => :sort

def combine(nested)
  return nested.flatten if nested[1].nil?                        # => false, false, true
  nested.each_with_index do |array, index|                       # => [[3, 5], [4, 5], [1, 2]], [[1, 2], [3, 4]]
    if array.count == 1                                          # => false, false, false, false, false
      if array[0] < nested[index - 1].first                      # =>
        array.concat nested[index - 1]
        nested.delete_at (index - 1)
      elsif nested[index - 1].last < array[0]                    # =>
        nested[index - 1] << array[0]
        nested.delete_at index
      else
        nested[index - 1].insert(1, array[0])                    # =>
        nested.delete_at index                                   # =>
      end                                                        # =>
    end                                                          # => nil, nil, nil, nil, nil
  end                                                            # => [[3, 5], [4, 5], [1, 2]], [[1, 2], [3, 4]]
  new_nested = []                                                # => [], []
  nested.each_with_index do |array, index|                       # => [[3, 5], [4, 5], [1, 2]], [[1, 2], [3, 4]]
      nested.flatten.count.times do                              # => 6, 4
        if array.nil? && nested[index + 1].nil?                  # => false, false, false, false, false, false, false, false, false, false
            break
        end
        if array.empty?                                          # => false, false, false, false, false, false, false, false, true, true
          if nested[index + 1].first                             # => 3, 4
            new_nested << nested[index + 1].first                # => [1, 2, 3], [1, 2, 3, 4]
            nested[index + 1].delete_at 0                        # => 3, 4
          end                                                    # => 3, 4
        elsif nested[index + 1].nil?                             # => false, false, false, false, false, false, false, false
          if array.first
            new_nested << array.first
            array.delete_at 0
          end
        else
          if !array.first.nil? && !nested[index + 1].first.nil?  # => true, true, true, true, true, true, true, true
            if array.first > nested[index + 1].first             # => false, true, false, false, false, false, false, false
              new_nested << nested[index + 1].first              # => [3, 4]
              nested[index + 1].delete_at 0                      # => 4
              nested[index + 1].nil?                             # => false
            elsif nested[index + 1].first > array.first          # => true, false, false, false, false, true, true
              new_nested << array.first                          # => [3], [1], [1, 2]
              array.delete_at 0                                  # => 3, 1, 2
            end                                                  # => 3, false, nil, nil, nil, nil, 1, 2
          end                                                    # => 3, false, nil, nil, nil, nil, 1, 2
        end                                                      # => 3, false, nil, nil, nil, nil, 1, 2, 3, 4
    end                                                          # => 6, 4
    nested.delete_at index                                       # => [5], []
    nested.delete_at index                                       # => [5], []
    nested << new_nested                                         # => [[1, 2], [3, 4]], [[1, 2, 3, 4]]
    new_nested                                                   # => [3, 4], [1, 2, 3, 4]
    break
  end                                                            # => nil, nil
  combine(nested)                                                # => [1, 2, 3, 4], [1, 2, 3, 4]
end                                                              # => :combine

array = [5, 3, 4, 5, 1, 2]     # => [5, 3, 4, 5, 1, 2]
nested = split(array)       # => [[5, 3], [4, 5], [1, 2]]
nested = sort(nested)       # => [[3, 5], [4, 5], [1, 2]]
combined = combine(nested)  # => [1, 2, 3, 4]





# --
