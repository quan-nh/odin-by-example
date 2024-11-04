package main

import "core:fmt"
import "core:math/rand"

// Odin’s math/rand package provides pseudorandom number generation.

main :: proc() {
	// For example, rand.int31_max returns a random int n, 0 <= n < 100.
	fmt.print(rand.int31_max(100), ",")
	fmt.print(rand.int31_max(100))
	fmt.println()

	// rand.float64 returns a float64 f, 0.0 <= f < 1.0.
	fmt.println(rand.float64())

	// This can be used to generate random floats in other ranges, for example 5.0 <= f' < 10.0.
	fmt.println(rand.float64_range(5, 10))
}
