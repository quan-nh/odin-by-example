package main

import "core:fmt"

Base :: struct {
	num: int,
}

Container :: struct {
	using base: Base, // using can be used to bring entities declared in a scope/namespace into the current scope
	str:        string,
}

main :: proc() {
	// When creating structs with literals, we have to initialize the embedding explicitly;
	// here the embedded type serves as the field name.
	co := Container {
		base = Base{num = 1},
		str = "some name",
	}

	// We can access the base’s fields directly on co, e.g. co.num.
	fmt.printf("co={{num: %v, str: %v}\n", co.num, co.str)

	// Alternatively, we can spell out the full path using the embedded type name.
	fmt.println("also num:", co.base.num)

	// Subtype polymorphism
	// It is possible to get subtype polymorphism, similar to inheritance-like functionality in C++
	foo(co) // 1
}

foo :: proc(base: Base) {
	fmt.println(base.num)
}
