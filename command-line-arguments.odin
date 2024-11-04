package main

import "core:fmt"
import "core:os"

// Command-line arguments are a common way to parameterize execution of programs.
// For example, odin run hello.odin uses run and hello.go arguments to the odin program.

main :: proc() {
	// os.Args provides access to raw command-line arguments.
	// Note that the first value in this slice is the path to the program,
	//  and os.Args[1:] holds the arguments to the program.
	argsWithProg := os.args
	argsWithoutProg := os.args[1:]

	// You can get individual args with normal indexing.
	arg := os.args[3]
	fmt.println(argsWithProg)
	fmt.println(argsWithoutProg)
	fmt.println(arg)
}

// To experiment with command-line arguments it’s best to build a binary with go build first.
/*
$ odin build command-line-arguments.odin -file
$ ./command-line-arguments a b c d
["./command-line-arguments", "a", "b", "c", "d"]
["a", "b", "c", "d"]
c
*/
