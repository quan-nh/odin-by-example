package main

// Odin only has non-capturing lambda procedures.
// For closures to work correctly would require a form of automatic memory management which will never be implemented into Odin.
foo :: proc() {
	y: int
	x := proc() -> int {
		// `y` is not available in this scope as it is in a different stack frame
		return 123
	}
}
