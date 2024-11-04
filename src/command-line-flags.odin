package main

// Command-line flags are a common way to specify options for command-line programs.
// For example, in wc -l the -l is a command-line flag.

// Odin provides a flags package supporting basic command-line flag parsing.
// We’ll use this package to implement our example command-line program.
import "core:flags"
import "core:fmt"

// Define program options
Options :: struct {
	word: string `usage:"a string"`,
	numb: int,
	fork: bool,
	svar: string,
}
main :: proc() {
}
