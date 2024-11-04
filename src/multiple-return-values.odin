package main

import "core:fmt"

// Odin has built-in support for multiple return values.
// This feature is used often in idiomatic Odin, for example to return both result and error values from a procedure.

// The (int, int) in this procedure signature shows that the procedure returns 2 ints.
vals :: proc() -> (int, int) {
	return 3, 7
}

main :: proc() {
	// Here we use the 2 different return values from the call with multiple assignment.
	a, b := vals()
	fmt.println(a)
	fmt.println(b)

	// If you only want a subset of the returned values, use the blank identifier _
	_, c := vals()
	fmt.println(c)
}
