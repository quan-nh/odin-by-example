package main

import "core:fmt"

main :: proc() {
	// The most basic type, with a single condition
	i := 1
	for i <= 3 {
		fmt.println(i)
		i = i + 1
	}

	// A classic initial/condition/after for loop
	for j := 0; j < 3; j += 1 {
		fmt.println(j)
	}

	// Another way of accomplishing the basic “do this N times” iteration is range over an integer
	for i in 0 ..< 3 {
		fmt.println("range", i)
	}
	// range 0
	// range 1
	// range 2

	// for without a condition will loop repeatedly until you break out of the loop or return from the enclosing function
	for {
		fmt.println("loop")
		break
	}

	// you can also continue to the next iteration of the loop
	for n in 0 ..= 5 {
		if n % 2 == 0 {
			continue
		}
		fmt.println(n)
	}
	// 1
	// 3
	// 5
}
