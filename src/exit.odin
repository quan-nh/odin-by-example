package main

import "core:fmt"
import "core:os"

// Use os.exit to immediately exit with a given status.
main :: proc() {
	// Error: Unreachable defer statement due to diverging procedure call at the end of the current scope
	// defer fmt.println("!")

	// Exit with status 3.
	os.exit(3)
}
