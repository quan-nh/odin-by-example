package main

import "core:fmt"

// In Odin, a procedure is something that can do work, which some languages call functions or methods.

// Here’s a procedure that takes two ints and returns their sum as an int
plus :: proc(a: int, b: int) -> int {
	// Odin requires explicit returns, i.e. it won’t automatically return the value of the last expression
	return a + b
}

// When you have multiple consecutive parameters of the same type,
// you may omit the type name for the like-typed parameters up to the final parameter that declares the type.
plusPlus :: proc(a, b, c: int) -> int {
	return a + b + c
}

main :: proc() {
	// Call a procedure just as you’d expect, with name(args).
	res := plus(1, 2)
	fmt.println("1+2 =", res)
	res = plusPlus(1, 2, 3)
	fmt.println("1+2+3 =", res)
}
