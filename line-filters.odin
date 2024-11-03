package main

import "core:bufio"
import "core:fmt"
import "core:os"
import "core:strings"

// A line filter is a common type of program that reads input on stdin, processes it, and then prints some derived result to stdout.
// grep and sed are common line filters.

// Here’s an example line filter in Odin that writes a capitalized version of all input text.
// You can use this pattern to write your own Odin line filters.
main :: proc() {
	// Wrapping the unbuffered os.Stdin with a buffered scanner gives us a convenient Scan method that advances the scanner to the next token; which is the next line in the default scanner.
	scanner: bufio.Scanner
	bufio.scanner_init(&scanner, os.stream_from_handle(os.stdin))

	// Text returns the current token, here the next line, from the input.
	for bufio.scanner_scan(&scanner) {
		ucl := strings.to_upper(bufio.scanner_text(&scanner))
		// Write out the uppercased line.
		fmt.println(ucl)
	}

	// Check for errors during Scan. End of file is expected and not reported by Scan as an error.
	if err := bufio.scanner_error(&scanner); err != nil {
		fmt.fprintln(os.stderr, "error:", err)
		os.exit(1)
	}
}

// To try out our line filter, first make a file with a few lowercase lines.
/*
$ echo 'hello'   > /tmp/lines
$ echo 'filter' >> /tmp/lines
*/
// Then use the line filter to get uppercase lines.
/*
$ cat /tmp/lines | odin run line-filters.odin -file
HELLO
FILTER
*/
