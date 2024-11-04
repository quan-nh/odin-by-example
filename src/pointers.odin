package main

import "core:fmt"

// Odin supports pointers, allowing you to pass references to values and records within your program.

// We’ll show how pointers work in contrast to values with 2 procedures: zeroval and zeroptr.

// zeroval has an int parameter, so arguments will be passed to it by value.
// zeroval will get a copy of ival distinct from the one in the calling procedure.
zeroval :: proc(ival: int) {
	// ival = 0 this will cause error as all parameters passed into a function are immutable
	// A useful idiom is var := var, which expresses a variable shadowing itself
	ival := ival
	ival = 0
}

// zeroptr in contrast has an ^int parameter, meaning that it takes an int pointer.
// The iptr^ code in the procedure body then dereferences the pointer from its memory address to the current value at that address.
// Assigning a value to a dereferenced pointer changes the value at the referenced address.
zeroptr :: proc(iptr: ^int) {
	iptr^ = 0
}

main :: proc() {
	i := 1
	fmt.println("initial:", i) // initial: 1
	zeroval(i)
	fmt.println("zeroval:", i) // zeroval: 1, value doesn't change

	// The &i syntax gives the memory address of i, i.e. a pointer to i.
	zeroptr(&i)
	fmt.println("zeroptr:", i) // zeroptr: 0, value is change now

	// Pointers can be printed too
	fmt.println("pointer:", &i) // pointer: 0x16BA1B248
}
// zeroval doesn’t change the i in main, but zeroptr does because it has a reference to the memory address for that variable.
