package main

import "core:fmt"
import "core:os"

// A defer statement defers the execution of a statement until the end of the scope it is in.
main :: proc() {
	x := 123
	defer fmt.println(x)

	{
		defer x = 4
		x = 2
	} // defer is execute after this

	fmt.println(x) // 4

	x = 234
} // first defer's execute & print 234

defer_order :: proc() {
	// Defer statements are executed in the reverse order that they were declared:
	defer fmt.println("1")
	defer fmt.println("2")
	defer fmt.println("3")
	// Will print 3, 2, and then 1.
}

defer_use_case :: proc() {
	// A real world use case for defer may be something like the following:
	f, err := os.open("my_file.txt")
	if err != os.ERROR_NONE {
		// handle error
	}
	defer os.close(f)
	// rest of code
}
