package main

import "core:fmt"

// Variadic procedures can be called with any number of trailing arguments.
// For example, fmt.println is a common variadic procedure.

// Here’s a procedure that will take an arbitrary number of ints as arguments.
sum :: proc(nums: ..int) {
	fmt.print(nums, " ")
	total := 0

	// Within the procedure, the type of nums is equivalent to []int.
	// We can call len(nums), iterate over it with range, etc.
	for num in nums {
		total += num
	}
	fmt.println(total)
}

main :: proc() {
	// Variadic procedures can be called in the usual way with individual arguments
	sum(1, 2)
	sum(1, 2, 3)

	// If you already have multiple args in a slice, apply them to a variadic procedure using func(..slice ) like this
	nums := []int{1, 2, 3, 4}
	sum(..nums)
}
