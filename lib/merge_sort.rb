array = [2, 0, 1, 3]

def split(array)
  return array[0] if array.count == 1
  if array.count % 2 == 0 # it has an even number of elements
    a = []
    b = []
    half_size = array.count / 2
    0.upto(half_size) do |i|
      a << array[i]
      split(a)
    end
    half_size.upto(array.count) do |i|
      b << array[i]
      split(b)
    end
  end
end

split(array) # =>
