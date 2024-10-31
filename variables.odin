package main

import "core:fmt"

main :: proc() {

	a: string // declare variable
	a = "initial"
	fmt.println(a)

	b, c: int = 1, 2 // you can declare multiple variables at once
	fmt.println(b, c)

	d := true // Odin will infer the type of initialized variables
	fmt.println(d)

	// Variables declared without a corresponding initialization are zero-valued.
	//  For example, the zero value for an int is 0.
	e: int
	fmt.println(e)

	f := "apple" // The := syntax is shorthand for declaring and initializing a variable
	fmt.println(f)
}
