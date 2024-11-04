package main

import "core:fmt"
import "core:time"

/*
Switch statements express conditionals across many branches.
*/
main :: proc() {
	// Here’s a basic switch.
	i := 2
	fmt.print("Write ", i, " as ")
	switch i {
	case 1:
		fmt.println("one")
	case 2:
		fmt.println("two")
	case 3:
		fmt.println("three")
	}

	// You can use commas to separate multiple expressions in the same case statement.
	// In Odin, the default case is denoted as a case without any expression.
	#partial switch time.weekday(time.now()) {
	case .Saturday, .Sunday:
		fmt.println("It's the weekend")
	case:
		fmt.println("It's a weekday")
	}

	// switch without an expression is an alternate way to express if/else logic.
	//  Here we also show how the case expressions can be non-constants.
	t := time.now()
	hour, _, _ := time.clock_from_time(t)
	switch {
	case hour < 12:
		fmt.println("It's before noon")
	case:
		fmt.println("It's after noon")
	}

	// A type switch compares types instead of values.
	//  You can use this to discover the type of an interface value.
	//  In this example, the variable f will have the type corresponding to its clause
	Foo :: union {
		int,
		bool,
	}
	f: Foo = 123
	switch _ in f {
	case int:
		fmt.println("int")
	case bool:
		fmt.println("bool")
	case:
	}
}
