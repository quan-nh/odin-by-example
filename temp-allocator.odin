package main

import "core:fmt"
import "core:math/rand"

// Many times you need to allocate some dynamic memory, but you do not need it later.
// So if you have code like this:
great_algorithm :: proc() -> int {
	numbers: [dynamic]int

	for i in 0 ..< 100 {
		append(&numbers, i)
	}

	rand.shuffle(numbers[:])
	n := numbers[0]
	delete(numbers)
	return n
}

// In this kind of situation, I would instead use the temp allocator:
great_algorithm2 :: proc() -> int {
	// tell the dynamic array to use the context.temp_allocator to allocate memory.
	// This means that we do not ‘care’ about this memory in the long run.
	numbers := make([dynamic]int, context.temp_allocator)

	for i in 0 ..< 100 {
		append(&numbers, i)
	}

	rand.shuffle(numbers[:])
	return numbers[0]
}

main :: proc() {
	fmt.println(great_algorithm())
	fmt.println(great_algorithm2())

	// free all the memory in the temp allocator at the end of main loop
	free_all(context.temp_allocator)
}
