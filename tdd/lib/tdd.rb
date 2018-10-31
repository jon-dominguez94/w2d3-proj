def my_uniq(array)
  raise ArgumentError unless array.is_a?(Array)
  arr = []
  array.each {|el| arr << el unless arr.include?(el)}
  arr
end

def two_sum(array)
  result = []
  array.each_index do |i|
    (i+1...array.length).each do |j|
      result << [i,j] if array[i] + array[j] ==0
    end
  end
  return result
end
