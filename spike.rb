#
#puts Module.class
#puts Module.superclass
#
#puts Class.class
#puts Class.superclass
#
#class Myclass
#
#end
#puts "!!!"
#puts Myclass.new
#
#puts Myclass.class
#puts Myclass.superclass
#puts Myclass.new().class.superclass

puts "I am a ruby programmer".split(' ').map{|word| word.reverse()}.join(' ')

array=[2,6,3,12,87,1,456,985,452,4]

#array=[3,45,1]
#puts array[3]

def bubble_sort(array)
  for i in (0...array.length-1)
    for j in (0...array.length-1-i)
      puts "i=#{i},j=#{j}"
      if array[j] > array[j+1]
        temp = array[j]
        array[j] = array[j+1]
        array[j+1] = temp
      end
    end
  end
end

#bubble_sort array
#puts array

def merge_sort(array, start_index, end_index)
  if start_index < end_index
    middle_index = (start_index + end_index)/2
    merge_sort(array, start_index, middle_index)
    merge_sort(array, middle_index + 1, end_index)
    merge(array, start_index, middle_index, end_index)
  end
end

def merge(array, start_index, middle_index, end_index)
  left_array, right_array = [],[]
  (start_index..middle_index).each_with_index do |i, index|
    left_array[index] = array[i]
  end
  (middle_index+1..end_index).each_with_index do |i, index|
    right_array[index] = array[i]
  end
  left_array[left_array.length] = -10000
  right_array[right_array.length] = -10000
  i ,j = 0, 0
  puts "start_index->#{start_index}, end_index->#{end_index}"

  for index in (start_index..end_index)
    #puts "start_index->#{start_index}, end_index->#{end_index}"
    if left_array[i] < right_array[j]
      array[index] = right_array[j]
      j+=1
    else
      array[index] = left_array[i]
      i += 1
    end
  end

end

#merge_sort(array, 0, array.length() -1)

def fast_sort(array, left_index, right_index)
  if left_index < right_index
    key = array[left_index]
    key_index = left_index
    (left_index + 1..right_index).each do |index|
      if array[index] < key
        temp = array[index]
        array.delete_at(index)
        array.insert(key_index, temp)
        key_index += 1
      end
    end
    fast_sort(array, left_index, key_index-1)
    fast_sort(array, key_index + 1, right_index)
  end
end

def yet_quick_sort(array)
  return array if array.length < 2
  left_array, right_array = array[1..-1].partition {|element| element < array.first}
  #yet_quick_sort(left_array) + [array.first] + yet_quick_sort(right_array)
  yet_quick_sort(right_array) + [array.first] + yet_quick_sort(left_array)
end

#def sort(array)
#  # return [] if array.empty?
#  return array if array.size < 2
#  left, right = array[1..-1].partition { |y| y <= array.first }
#  sort(left) + [ array.first ] + sort(right)
#end

#fast_sort(array, 0, array.length() -1)
#yet_quick_sort array
#puts sort array
puts yet_quick_sort array
#puts array[1..-2

#puts [2,1,3,4,5][0..-2]