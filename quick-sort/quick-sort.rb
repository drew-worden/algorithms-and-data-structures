#Implementation of the Quick Sort Algorithm in Ruby
#by Drew Worden

def quick_sort(arr)
	return arr if arr.length <= 1
  
	pivot = arr[0]
  
	less_than_pivot = arr[1..-1].select { |element| element <= pivot }
	greater_than_pivot = arr[1..-1].select { |element| element > pivot }
  
	sorted_less = quick_sort(less_than_pivot)
	sorted_greater = quick_sort(greater_than_pivot)
  
	return sorted_less + [pivot] + sorted_greater
  end
  
  array = [38, 27, 43, 3, 9, 82, 10]
  sorted_array = quick_sort(array)
  puts "Original array: #{array}"
  puts "Sorted array: #{sorted_array}"
  