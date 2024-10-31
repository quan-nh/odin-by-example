package main

import "core:fmt"

// Odin supports recursive procedures. Here’s a classic example.

// This fact procedure calls itself until it reaches the base case of fact(0).
fact :: proc(n: int) -> int {
	if n == 0 {
		return 1
	}
	return n * fact(n - 1)
}
main :: proc() {
	fmt.println(fact(7)) // 5040
}
