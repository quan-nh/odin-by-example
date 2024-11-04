package main

// https://odin-lang.org/docs/testing/
// - Multi-threaded by default.
// - Memory usage tracking: tests will report leaks and bad frees when complete.
// - Logging

// Assume a package with foobar.odin and foobar_test.odin.
// Anything in foobar_test.odin will be hidden from foobar.odin, unless the odin test command is used.

import "core:fmt"
import "core:testing"

@(test)
my_test :: proc(t: ^testing.T) {
	n := 2 + 2

	// Check if `n` is the expected value of `4`.
	// If not, fail the test with the provided message.
	testing.expect(t, n == 4, "2 + 2 failed to equal 4.")
}

// Add up all the rune values in the string.
my_very_simple_hash_function :: proc(str: string) -> (result: int) {
	for r in str {
		result += cast(int)r
	}
	return
}

@(test)
my_test2 :: proc(t: ^testing.T) {
	hash := my_very_simple_hash_function("hellope")
	testing.expect_value(t, hash, 745)
}

// $ odin test
