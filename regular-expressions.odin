package main

import "core:bytes"
import "core:fmt"
import "core:text/regex"

// Odin offers built-in support for regular expressions.
// Here are some examples of common regexp-related tasks in Odin.

main :: proc() {
	// This tests whether a pattern matches a string.
	r, _ := regex.create("p([a-z]+)ch")
	fmt.println(regex.match(r, "peach"))
	// Capture{pos = [[0, 5], [1, 3]], groups = ["peach", "ea"]} true
}
