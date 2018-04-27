require 'byebug'

def sum_to(n)
  if n < 1
    nil
  elsif n == 1
    1
  else
    n + sum_to(n - 1)
  end
end

# Test Cases
p sum_to(5) == 15 # => returns 15
p sum_to(1) == 1 # => returns 1
p sum_to(9) == 45  # => returns 45
p sum_to(-8) == nil # => returns nil

def add_numbers(nums_array)
  if nums_array.empty?
    nil
  elsif nums_array.length < 2
    nums_array[0]
  else
    nums_array[0] + add_numbers(nums_array[1..-1])
  end
end

# Test Cases
p add_numbers([1,2,3,4]) == 10
p add_numbers([3]) == 3
p add_numbers([-80,34,7]) == -39
p add_numbers([]) == nil

def gamma_fnc(n)
  if n == 0
    nil
  elsif n == 1
    1
  else
    (n - 1) * gamma_fnc(n - 1)
  end
end

# Test Cases
p gamma_fnc(0) == nil
p gamma_fnc(1) == 1
p gamma_fnc(4) == 6
p gamma_fnc(8) == 5040

def ice_cream_shop(flavors, favorite)
  if flavors.length < 1
    false
  elsif flavors[0] != favorite
    ice_cream_shop(flavors[1..-1], favorite)
  else
    true
  end
end

# Test Cases
p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon') == false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea') == true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio') == false
p ice_cream_shop(['moose tracks'], 'moose tracks') == true
p ice_cream_shop([], 'honey lavender') == false

def reverse(string)
  if string.empty?
    string
  elsif string.length < 2
    string[0]
  else
    reverse(string[1..-1]) + string[0]
  end
end

p reverse("house") == "esuoh"
p reverse("dog") == "god"
p reverse("atom") == "mota"
p reverse("q") == "q"
p reverse("id") == "di"
p reverse("") == ""
