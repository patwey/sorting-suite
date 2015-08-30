array = ['c', 'a', 'b', 'd']

def split_left(array)
  if array.count == 2
    left = array.slice!(0, 1)
    right = array
    return left, right
  else
    array = array.slice!(0, array.count / 2)
  end
  split_left(array)
end

def split_right(array)
  if array.count == 2
    left = array.slice!(0, 1)
    right = array
    return left, right
  else
    array = array.slice(array.count / 2, array.count)
  end
  split_right(array)
end

def combine(left, right, combined)
  # combined = [] if combined.nil?
  if left.count == 0 && right.count == 0
    return combined

  elsif left[0] && right[0] # they're not nil

    if left[0] < right[0]
      combined << left[0]
      left.delete_at 0
    else
      combined << right[0]
      right.delete_at 0
    end

  elsif left[0].nil? && right[0]
    combined << right[0]
    right.delete_at 0

  elsif right[0].nil? && left[0]
    combined << left[0]
    left.delete_at 0

  end
  combine(left, right, combined)
end

left, right = split_left(array)
left # => ["c"]
right # => ["a"]

combined = []
combined = combine(left, right, combined)
combined # => ["a", "c"]





__END__

left_r, right_r = split_right(array)
left_r # => ["b"]
right_r # => ["d"]
