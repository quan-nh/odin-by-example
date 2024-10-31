package main

import "core:fmt"

main :: proc() {
	// Here’s a basic example
	if 7 % 2 == 0 {
		fmt.println("7 is even")
	} else {
		fmt.println("7 is odd")
	}

	// You can have an if statement without an else
	if 8 % 4 == 0 {
		fmt.println("8 is divisible by 4")
	}

	// Logical operators like && and || are often useful in conditions
	if 8 % 2 == 0 || 7 % 2 == 0 {
		fmt.println("either 8 or 7 are even")
	}

	// A statement can precede conditionals; any variables declared in this statement are available in the current and all subsequent branches
	if num := 9; num < 0 {
		fmt.println(num, "is negative")
	} else if num < 10 {
		fmt.println(num, "has 1 digit")
	} else {
		fmt.println(num, "has multiple digits")
	}

	// Note that you don’t need parentheses around conditions in Odin, but that the braces are required

	// Odin support Ternary Operators
	// x if cond else y   // ternary runtime conditional expression
	// x when cond else y // ternary compile-time conditional expression
	// cond ? x : y       // ternary runtime conditional expression, equivalent to "x if cond else y"
}
