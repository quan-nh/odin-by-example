package main

import "core:fmt"
import "core:slice"

// Sometimes we’ll want to sort a collection by something other than its natural order. For example, suppose we wanted to sort strings by their length instead of alphabetically.
// Here’s an example of custom sorts in Odin.

main :: proc() {
	fruits := []string{"peach", "banana", "kiwi"}

	// We implement a comparison function for string lengths.
	len_cmp := proc(a, b: string) -> slice.Ordering {
		if len(a) < len(b) {
			return .Less
		} else if len(a) > len(b) {
			return .Greater
		} else {
			return .Equal
		}
	}

	// Now we can call slice.sort_by_cmp with this custom comparison function to sort fruits by name length.
	slice.sort_by_cmp(fruits, len_cmp)
	fmt.println(fruits) // ["kiwi", "peach", "banana"]

	// We can use the same technique to sort a slice of values that aren’t built-in types.
	Person :: struct {
		name: string,
		age:  int,
	}
	people := []Person {
		Person{name = "Jax", age = 37},
		Person{name = "TJ", age = 25},
		Person{name = "Alex", age = 72},
	}

	// Sort people by age using slice.sort_by
	// Note: if the Person struct is large, you may want the slice to contain *Person instead and adjust the sorting function accordingly. If in doubt, benchmark!
	slice.sort_by(people, proc(a, b: Person) -> bool {
		return a.age < b.age
	})
	fmt.println(people)
	// [Person{name = "TJ", age = 25}, Person{name = "Jax", age = 37}, Person{name = "Alex", age = 72}]
}
