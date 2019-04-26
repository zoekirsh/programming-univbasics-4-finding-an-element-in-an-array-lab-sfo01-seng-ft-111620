def find_element_index(array, value_to_find)
  count = 0
  while count < array.length do
    return count if array[count] == value_to_find
    count += 1
  end
end