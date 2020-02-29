# Using Loops and Arrays to Find Data

## Learning Goals

- Work with arrays and loops to extract specific values
- Use loops to compare values in an array

## Introduction

We've stepped away from the idea of programming as conversation in these last
few lessons. But now that you understand what an Array is and how it mirrors
real life. You might realize that you've been working with Arrays all the time!

* Do any of the children have a runny nose?
* Do all of the children have a runny nose?
* "Is there a doctor in the house?"
* Do all of the dogs have their rabies vaccination?
* Who is the fastest runner?
* What is the lowest temperature Maui will see during my vacation?

Given an Array with the appropriate data, you now can loop through it and return
the critical bit of information.

We're going to practice working with arrays and loops in a bit more depth. We
will be using them to implement a typical pattern: looping through an array to
find the position of a value.

## Instructions

For this lab's tests, assume all arrays are sets of **positive integers**. The
method and parameter names are already provided for you in
`lib/find_in_array.rb`. Your task is to write the implementation.

## Finding Where an Element is Located on an Array

This method, `find_element_index(array, value_to_find)`, takes in two
parameters, an array of integers and a value to find. This method should
return the _index_ of the value that was passed in. If the value is not found,
this method should return `nil`.

To implement this method, you will need loop over the provided array and compare
each value in the array to the value provided. Remember though, that this is
_not_ the value that needs to be returned.

A walkthrough for this lab is provided below, but first, try your best to solve
this on your own.

...

...

...

## Solving this Lab

In previous labs, we used loops to use or modify elements in an array. This
time, we need to loop through an array and compare each element to a provided
value. We'll first need to set up the basic loop:

```rb
def find_element_index(array, value_to_find)
  count = 0
  while count < array.length do
    # comparison code will go here
    count += 1
  end
end
```

The above code will let us loop through the provided array. We can access each
element with `array[count]` starting with `array[0]`. We now need to write code
that will compare each array element to `value_to_find`. For now, we can simply
`puts` the result of this comparison:

```rb
def find_element_index(array, value_to_find)
  count = 0
  while count < array.length do
    puts array[count] == value_to_find
    count += 1
  end
end
```

Since `array[count] == value_to_find` returns `true` or `false`, if we were to run
this in IRB, we'd get a list:

```sh
2.6.1 :010 > array = [6, 5, 4, 3, 2, 1]
 => [6, 5, 4, 3, 2, 1]
2.6.1 :011 > find_element_index(array, 2)
false
false
false
false
true
false
 => nil
```

Above, the number `2` is the value to find. We can see in the array that it is
in the fifth position and `find_element_index` method confirms by the outputting
`true` during the fifth loop.

We haven't solved this lab yet, though. The task is to return the _index_ of an
element in the array that matches the value to find. In the example above, `2`
is in the fifth position in the array, but we start array indexes at `0`, so its
**index is equal to `4`**. How might we capture this value and return it?

Fortunately for us, we are already capturing the a value equivalent to the index
we need: `count`! The `count` variable starts at `0` and increments by one on
every loop.

One possible solution - we could create a second variable (let's call it
`found_value_index`) and assign it when we find the value we're looking for.
Then, after the looping completes, we could return this variable.

```rb
def find_element_index(array, value_to_find)
  count = 0
  found_value_index = nil
  while count < array.length do
    if array[count] == value_to_find
      found_value_index = count
    end
    count += 1
  end
  found_value_index
end
```

In this example, we start by assigning `found_value_index` to `nil`. The second
test in this lab expects `find_element_index` to return `nil` if no match is
found. The way we've set this method up, `found_value_index` will continue to
equal `nil` _until_ a match is found. During every loop, if `array[count]` is
equal to `value_to_find`, `found_value_index` is set to the current `count`. At
the end, `found_value_index` is returned.

This is a valid solution to this lab. There are, however, other solutions that
behave slightly differently. In the above solution, for instance, the code will
_always_ loop through the entire array. Another thing to notice - if the
provided array has repeating values that match the value to find, this solution
will return the _last_ matching index.

A slightly modified solution changes this:

```rb
def find_element_index(array, value_to_find)
  count = 0
  while count < array.length do
    if array[count] == value_to_find
      return count
    end
    count += 1
  end
end
```

This solution drops the extra variable. Instead, if a match is found between an
array element and the value to find, we immediately return `count`, breaking out
of the loop. _This_ solution will always return the _first_ index of a matching
element in the provided array. It also will stop working as soon as it finds a
match, rather than continuing to loop.

If there is no match found, the loop exits and the method ends. The `while` loop
statement doesn't return anything, so `find_element_index` returns `nil` when no
match is found.

## Conclusion

When working with arrays, it is often necessary that we find specific array
elements. This is such a common task that Ruby provides a built-in method that
will complete this task on any array: `.index`.

```sh
2.6.1 :001 > array = [5, 4, 3, 2, 1]
 => [5, 4, 3, 2, 1]
2.6.1 :002 > array.index(5)
 => 0
2.6.1 :003 > array.index(1)
 => 4
```

Technically, this lab could be solved with the following:

```rb
def find_element_index(array, value_to_find)
  array.index(value_to_find)
end
```

Though in a real coding situation, this method would be redundant - we would
skip writing a custom method and use `array.index` directly.

You might ask - why do we learn the loop way if something exists that does this
work for us? The main reason is that implementing our own version allows us to
understand and appreciate how something works. There is no magic. By writing the
code, you will be able to better visualize what happens when a method like
`.index` is called.

Building our own versions is also useful for times when you need to do something
that doesn't quite work with the existing tools.

## Resources

- [Arrays](https://ruby-doc.org/core-2.5.3/Array.html)
