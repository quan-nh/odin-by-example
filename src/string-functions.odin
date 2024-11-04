package main

import "core:fmt"
import s "core:strings"

// The standard library’s strings package provides many useful string-related functions.
// Here are some examples to give you a sense of the package.

// We alias fmt.println to a shorter name as we’ll use it a lot below.
p := fmt.println

main :: proc() {
	// Here’s a sample of the functions available in strings.
	// Since these are functions from the package, not methods on the string object itself, we need pass the string in question as the first argument to the function.
	// You can find more functions in the strings package docs.
	p("Contains:  ", s.contains("test", "es"))
	p("Count:     ", s.count("test", "t"))
	p("HasPrefix: ", s.has_prefix("test", "te"))
	p("HasSuffix: ", s.has_suffix("test", "st"))
	p("Index:     ", s.index("test", "e"))
	p("Join:      ", s.join([]string{"a", "b"}, "-"))
	p("Repeat:    ", s.repeat("a", 5))
	p("Replace:   ", s.replace("foo", "o", "0", -1))
	p("Replace:   ", s.replace("foo", "o", "0", 1))
	p("Split:     ", s.split("a-b-c-d-e", "-"))
	p("ToLower:   ", s.to_lower("TEST"))
	p("ToUpper:   ", s.to_upper("test"))
}
// Contains:   true
// Count:      2
// HasPrefix:  true
// HasSuffix:  true
// Index:      1
// Join:       a-b
// Repeat:     aaaaa
// Replace:    f00 true
// Replace:    f0o true
// Split:      ["a", "b", "c", "d", "e"]
// ToLower:    test
// ToUpper:    TEST
