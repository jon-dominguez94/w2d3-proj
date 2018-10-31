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

def my_transpose(array)
  raise ArgumentError unless array.is_a?(Array)
  result = Array.new(array.length) {[]}
  array.each_with_index do |row, i|
    row.each_index do |j|
      result[j][i] = array[i][j]
    end
  end
  result
end

def stock(array)
  raise ArgumentError unless array.is_a?(Array)
  pair = []
  profit = 0
  array.each_with_index do |el,i|
    (i+1...array.length).each do |j|
      if array[j] - el > profit
        profit = array[j] - el
        pair = [i,j]
      end
    end
  end
  pair
end
