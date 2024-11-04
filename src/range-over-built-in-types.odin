package main

import "core:fmt"

// range iterates over elements in a variety of built-in data structures.
// Let’s see how to use range with some of the data structures we’ve already learned.

main :: proc() {
	// Here we use range to sum the numbers in a slice.
	// Arrays work like this too.
	nums := []int{2, 3, 4}
	sum := 0
	for num in nums {
		sum += num
	}
	fmt.println("sum:", sum)

	// Alternatively a second index value can be added:
	for num, i in nums {
		if num == 3 {
			fmt.println("index:", i)
		}
	}

	// range on map iterates over key/value pairs.
	kvs := map[string]string {
		"a" = "apple",
		"b" = "banana",
	}
	defer delete(kvs)

	for k, v in kvs {
		fmt.printf("%s -> %s\n", k, v)
	}

	// range can also iterate over just the keys of a map.
	for k in kvs {
		fmt.println("key:", k)
	}

	// range on strings iterates over Unicode code points.
	// The first value is the starting byte index of the rune and the second the rune itself.
	// See Strings and Runes for more details.
	for c, i in "Hello, 世界" {
		fmt.println(i, c)
	}
}
