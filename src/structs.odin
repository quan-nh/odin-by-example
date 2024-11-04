package main

import "core:fmt"

// Odin’s structs are typed collections of fields.
// They’re useful for grouping data together to form records.

// This person struct type has name and age fields.
person :: struct {
	name: string,
	age:  int,
}

// newPerson constructs a new person struct with the given name.
newPerson :: proc(name: string) -> ^person {
	p := new(person) // allocates memory and returns a pointer
	p.name = name
	p.age = 42
	return p
}

main :: proc() {
	// This syntax creates a new struct.
	fmt.println(person{"Bob", 20})

	// You can name the fields when initializing a struct.
	fmt.println(person{name = "Alice", age = 30})

	// Omitted fields will be zero-valued.
	fmt.println(person{name = "Fred"})

	// An & prefix yields a pointer to the struct.
	fmt.println(&person{name = "Ann", age = 40})

	// Odin is manual memory management
	p_ptr := newPerson("Jon")
	defer free(p_ptr) // don't forget to free the memory

	fmt.println(p_ptr) // &person{name = "Jon", age = 42}

	// Access struct fields with a dot.
	s := person {
		name = "Sean",
		age  = 50,
	}
	fmt.println(s.name) // Sean

	// You can also use dots with struct pointers - the pointers are automatically dereferenced.
	sp := &s
	fmt.println(sp.age) // 50

	// Structs are mutable.
	sp.age = 51
	fmt.println(sp.age) // 51

	// If a struct type is only used for a single value, we don’t have to give it a name.
	// The value can have an anonymous struct type.
	// This technique is commonly used for table-driven tests.
	dog := struct {
		name:   string,
		isGood: bool,
	}{"Rex", true}
	fmt.println(dog)
}
