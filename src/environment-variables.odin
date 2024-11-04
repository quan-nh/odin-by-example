package main

import "core:fmt"
import "core:os"
import "core:strings"

// Environment variables are a universal mechanism for conveying configuration information to Unix programs.
// Let’s look at how to set, get, and list environment variables.

main :: proc() {
	// To set a key/value pair, use os.Setenv.
	// To get a value for a key, use os.Getenv.
	// This will return an empty string if the key isn’t present in the environment.
	os.set_env("FOO", "1")
	fmt.println("FOO:", os.get_env("FOO")) // FOO: 1
	fmt.println("BAR:", os.get_env("BAR")) // BAR:

	fmt.println()

	// Use os.Environ to list all key/value pairs in the environment.
	// This returns a slice of strings in the form KEY=value.
	// You can strings.SplitN them to get the key and value.
	// Here we print all the keys.
	for e in os.environ() {
		pair := strings.split_n(e, "=", 2)
		fmt.println(pair[0])
	}
}
