package main

// Command-line flags are a common way to specify options for command-line programs.
// For example, in wc -l the -l is a command-line flag.

// Odin provides a flags package supporting basic command-line flag parsing.
// We’ll use this package to implement our example command-line program.
import "core:flags"
import "core:fmt"
import "core:os"

// Define program options
Options :: struct {
	word: string `usage:"a string"`,
	numb: int `usage:"an int"`,
	fork: bool `usage:"a bool"`,
	svar: string `usage:"a string var"`,
}
main :: proc() {
	opts: Options
	result := flags.parse(&opts, os.args[1:])

	fmt.println("result:", result) // result: nil
	fmt.println("opts:", opts) // opts: Options{word = "opt", numb = 7, fork = true, svar = "flag"}
}
/*
$ odin build command-line-flags -file
$ ./command-line-flags  -word=opt -numb=7 -fork -svar=flag
result: nil
opts: Options{word = "opt", numb = 7, fork = true, svar = "flag"}
*/
