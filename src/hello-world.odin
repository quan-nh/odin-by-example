package main

import "core:fmt"

main :: proc() {
	fmt.println("Hellope!")
}

// run the current directory:
// $ odin run .

// run the current file:
// $ odin run hello-world.odin -file

// to build:
// $ odin build <dir>
