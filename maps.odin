package main

import "core:fmt"

/*
Maps are Odin’s built-in associative data type (sometimes called hashes or dicts in other languages).
*/
main :: proc() {
	// To create an empty map, use the builtin make: make(map[key-type]val-type).
	m := make(map[string]int)
	defer delete(m) // cleanup after use

	// Set key/value pairs using typical name[key] = val syntax
	m["k1"] = 7
	m["k2"] = 13

	// Printing a map with e.g. fmt.println will show all of its key/value pairs
	fmt.println("map:", m) // map: map[k2=13, k1=7]

	// Get a value for a key with name[key]
	v1 := m["k1"]
	fmt.println("v1:", v1)

	// If the key doesn’t exist, the zero value of the value type is returned
	v3 := m["k3"]
	fmt.println("v3:", v3)

	// The builtin len returns the number of key/value pairs when called on a map
	fmt.println("len:", len(m)) // len: 2

	// The builtin delete_key removes key/value pairs from a map
	delete_key(&m, "k2")
	fmt.println("map:", m) // map: map[k1=7]

	// To remove all key/value pairs from a map, use the clear builtin.
	clear(&m)
	fmt.println("map:", m) // map: map[]

	// The optional second return value when getting a value from a map indicates if the key was present in the map.
	// This can be used to disambiguate between missing keys and keys with zero values like 0 or "".
	// Here we didn’t need the value itself, so we ignored it with the blank identifier _
	_, prs := m["k2"]
	fmt.println("prs:", prs) // prs: false

	// You can also declare and initialize a new map in the same line with this syntax
	n := map[string]int {
		"foo" = 1,
		"bar" = 2,
	}
	fmt.println("map:", n)
}
// Note that maps appear in the form map[k=v, k=v] when printed with fmt.println.
