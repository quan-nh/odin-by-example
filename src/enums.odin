package main

import "core:fmt"

main :: proc() {
	// Enumeration types define a new type whose values consist of the ones specified.
	// The values are ordered, for example:
	Direction :: enum {
		North,
		East,
		South,
		West,
	}
	assert(int(Direction.North) == 0)
	assert(int(Direction.East) == 1)
	assert(int(Direction.South) == 2)
	assert(int(Direction.West) == 3)

	// Enum fields can be assigned an explicit value:
	Foo :: enum {
		A,
		B = 4,
		C = 7,
	}

	// Implicit Selector Expression
	f: Foo
	f = Foo.A
	f = .A

	switch f {
	case .A:
		fmt.println("foo")
	case .B:
		fmt.println("bar")
	case .C:
		fmt.println("baz")
	}

	// Enums can be trivially for looped in odin
	for direction, index in Direction {
		fmt.println(index, direction)
	}
	// 0 North
	// 1 East
	// 2 South
	// 3 West

	// Enumerated Arrays allow the use of an Enum to be used as indices to a fixed array.
	arr: [enum {
		A,
		B,
		C,
	}]int

	arr = #partial {
		.A = 42,
	}
	fmt.println(arr) // [.A = 42, .B = 0, .C = 0]
}
