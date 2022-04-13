require "byebug"

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

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left[0] < right[0]
      merged << left.shift
    else 
      merged << right.shift
    end
  end
  merged + left + right
end

def merge_sort(array)
  return array if array.length == 1
  half_idx = array.length / 2
  left = array[0...half_idx]
  right = array[half_idx..-1]
  merge(merge_sort(left), merge_sort(right))
end

# array = [-1231, 12312, 231, 231, 1, 26, 8, 123, 20]

def subsets(array)
  return [[]] if array.empty?
  saved = subsets(array[0...-1])
  
  saved.each do s|ele|
    ele << array[-1]
  end

  subsets(array[0...-1]) + saved
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# GOOGLED
def permutations(nums)
  permutations = []
  helper(nums, [], permutations)
  permutations
end

def helper(nums, result, permutations)
  return permutations << result if nums.empty?
  
  nums.each do |num|
    rest = nums - [num]
    helper(rest, result + [num], permutations)
  end
end

p permutations([1,2,3])
