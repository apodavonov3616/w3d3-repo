def rec_range(num1, num2)
  return [] if num2 <= num1
  
  arr = rec_range(num1, (num2 - 1))
  arr += [num2 - 1]
end

# p rec_range(1, 5)

def iter_range(num1, num2)
  arr = []
  (num1...num2).each { |num| arr << num }
  arr
end

# p iter_range(1, 5)

def exponentiationv1(b, n)
  return 1 if n == 0
  b * exponentiationv1(b, n - 1)
end

# p exponentiationv1(2, 4)

def exponentiationv2(b, n)
  return 1 if n == 0
  return b if n == 1
  
  if n.even?
    exponentiationv2(b, n / 2) ** 2
  else
    b * (exponentiationv2(b, (n - 1) / 2) ** 2)
  end
end

# p exponentiationv2(2, 3)

class Array
  def deepdup
    return self if !self.is_a?(Array)

    newarr = []

    self.each do |subarr|
      if subarr.is_a?(Array)
        newarr << subarr.deepdup 
      else
        newarr << subarr
      end
    end

    newarr
  end
end

# example = [1, [2], [3, [4]]]
# p example.deepdup

def fibonacci(n)
  return [] if n == 0
  return [1] if n == 1
  return [1, 1] if n == 2

  newarr = fibonacci(n - 1)
  newarr << newarr[-1] + newarr[-2]
end

# p fibonacci(5)

def bsearch(array, target)
  halfidx = array.length / 2
  left = array[0...halfidx]
  right = array[halfidx..-1]
  return nil if halfidx == 0 && array[halfidx] != target
  if array[halfidx] > target
    bsearch(left, target)
  elsif array[halfidx] < target
    left.length + bsearch(right, target) if bsearch(right, target)!= nil
  else
    return halfidx if array[halfidx] == target
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr1, arr2)
  new_arr = []
  while arr1.length != 0 && arr2.length !=0
    if arr1[0] < arr2[0] || arr2.length == 0
      new_arr << arr1.shift
    else 
      new_arr << arr2.shift 
    end
  end
  new_arr
end


require 'byebug'
def merge_sort(array)
  # debugger
  # return [] if array.length == 0 
  return array if array.length == 1
  half_idx = array.length / 2
  left = array[0...half_idx]
  right = array[half_idx..-1]
  merge(merge_sort(left), merge_sort(right))
end

array = [38,27,43,3,9,82,10]
p merge_sort(array)