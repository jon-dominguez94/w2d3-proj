def my_uniq(array)
  raise ArgumentError unless array.is_a?(Array)
  arr = []
  array.each {|el| arr << el unless arr.include?(el)}
  arr
end
