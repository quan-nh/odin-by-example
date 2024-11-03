package main

// Parsing numbers from strings is a basic but common task in many programs;
// here’s how to do it in Odin.

import "core:fmt"
// The built-in package strconv provides the number parsing.
import "core:strconv"

main :: proc() {
	// With parse_f64
	f, _ := strconv.parse_f64("1.234")
	fmt.println(f)

	// parse_i64_of_base 10
	i, _ := strconv.parse_i64_of_base("123", 10)
	fmt.println(i)

	// parse_int with default base=0 will recognize hex-formatted numbers.
	d, _ := strconv.parse_int("0x1c8")
	fmt.println(d) // 456

	// A ParseUint is also available.
	u, _ := strconv.parse_uint("789", 0)
	fmt.println(u)

	// atoi is a convenience function for basic base-10 int parsing.
	k := strconv.atoi("135")
	fmt.println(k)

	// Parse functions return 0 on bad input.
	e := strconv.atoi("wat")
	fmt.println(e)
}
