package main

import "core:fmt"

Error :: union {
	ValueError,
	BarError,
	BazError,
	PlopError,
}

foo :: proc() -> (Value_Type, Error) { ... }

x, err := foo();

switch e in err {
case ValueError:
	 // Handle error
case BarError:
	// Handle error
case BazError, PlopError:
	// Handle errors
}

// catch all
x, err := foo();
if err != nil {
	// An error has happened
}
