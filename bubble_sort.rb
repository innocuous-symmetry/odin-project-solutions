### BUBBLE SORT
def bubble_sort(input_array)
  left = 0

  until left + 1 == input_array.length
    right = left + 1
    if input_array[left] > input_array[right]
      input_array[left], input_array[right] = input_array[right], input_array[left]
      bubble_sort(input_array)
    end
    left += 1
  end

  input_array
end

print bubble_sort([4,3,78,2,0,2])
