# When done, submit this entire file to the autograder.

# Part 1

def sum(arr)
  sum = 0
  arr.each do |element| sum+=element end
  sum
end

def max_2_sum(arr)
  if arr.empty?
    return 0
  end
  
  if arr.length == 1
    return arr[0]
  end
  
  arr[0] > arr[1] ? (highest = arr[0]; second_highest = arr[1]) : (highest = arr[1]; second_highest = arr[0]) 
  arr.drop(2).each do |element|
    if element > second_highest
      if element > highest
        second_highest = highest
        highest = element
      else
        second_highest = element
      end
    end
  end
  return (highest + second_highest)
end

def sum_to_n?(arr, n)
  if arr.length <2
    return false
  end
  
  arr.sort!
  start_pointer = 0
  end_pointer = arr.length-1
  while start_pointer != end_pointer
    if (arr[start_pointer] + arr[end_pointer] == n)
      return true
    elsif arr[start_pointer] + arr[end_pointer] < n
      start_pointer += 1
    else
      end_pointer -= 1
    end
  end
  false
end

# Part 2

def hello(name)
  "Hello, " + name
end

def starts_with_consonant?(s)
  if s.length == 0
    return false
  end
  
  consonants = ['a','e','i','o','u']
  if consonants.include?(s[0].downcase)
    return false
  elsif /[A-Za-z]/ =~ s[0].downcase
    return true
  end
  false
end

def binary_multiple_of_4?(s)
  for i in 0..(s.length-1)
    if s[i] != '0' && s[i] != '1'
      return false
    end
  end
  
  if s == "0"
    return true
  end
  
  if s[s.length - 3..s.length-1] == "100"
    return true
  else 
    return false
  end
end

# Part 3
class BookInStock
  def initialize(isbn,price)
    if isbn =~ /^0?[a-z\-]+/i
      @isbn = isbn
    else
      raise ArgumentError, 'ISBN is not formatted correctly'
    end
    
    if price <= 0
      raise ArgumentError, 'price must be positive'
    else
      @price = price
    end
  end
  
  attr_accessor :price
  attr_accessor :isbn
  
  def price_as_string()
    "$#{'%.02f' % @price}"
  end
end
