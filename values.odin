package main

import "core:fmt"

main :: proc() {
	// Strings, which can be added together with +
	fmt.println("odin" + "lang") // odinlang

	// Integers and floats
	fmt.println("1+1 =", 1 + 1) // 1+1 = 2
	fmt.println("7.0/3.0 =", 7.0 / 3.0) // 7.0/3.0 = 2.3333333333333335

	// Booleans, with boolean operators as you’d expect
	fmt.println(true && false) // false
	fmt.println(true || false) // true
	fmt.println(!true) // false
}
