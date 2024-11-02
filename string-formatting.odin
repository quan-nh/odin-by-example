package main

import "core:fmt"
import "core:os"

// Odin offers excellent support for string formatting in the printf tradition.
// Here are some examples of common string formatting tasks.
point :: struct {
	x, y: int,
}

main :: proc() {
	// Odin offers several printing “verbs” designed to format general Odin values.
	// For example, this prints an instance of our point struct.
	p := point{1, 2}
	fmt.printf("struct1: %v\n", p) // struct1: point{x = 1, y = 2}

	// %#v    an expanded format of %v with newlines and indentation
	fmt.printf("struct3: %#v\n", p)
	// struct3: point{
	// 		x = 1,
	// 		y = 2,
	// }

	// To print the type of a value, use %T.
	fmt.printf("type: %T\n", p) // type: point

	// Formatting booleans is straight-forward.
	fmt.printf("bool: %t\n", true) // bool: true

	// There are many options for formatting integers.
	// Use %d for standard, base-10 formatting.
	fmt.printf("int: %d\n", 123) // int: 123

	// This prints a binary representation.

	fmt.printf("bin: %b\n", 14) // bin: 1110

	// This prints the character corresponding to the given integer.
	fmt.printf("char: %c\n", 33) // char: !

	// %x provides hex encoding.
	fmt.printf("hex: %x\n", 456) // hex: 1c8

	// There are also several formatting options for floats.
	// For basic decimal formatting use %f.
	fmt.printf("float1: %f\n", 78.9) // float1: 78.900

	// %e and %E format the float in (slightly different versions of) scientific notation.
	fmt.printf("float2: %e\n", 123400000.0) // float2: 1.234000e+08
	fmt.printf("float3: %E\n", 123400000.0) // float3: 1.234000E+08

	// For basic string printing use %s.
	fmt.printf("str1: %s\n", "\"string\"") // str1: "string"

	// To double-quote strings as in Odin source, use %q.
	fmt.printf("str2: %q\n", "\"string\"") // str2: "\"string\""

	// As with integers seen earlier, %x renders the string in base-16, with two output characters per byte of input.
	fmt.printf("str3: %x\n", "hex this") // str3: 6865782074686973

	// To print a representation of a pointer, use %p.
	fmt.printf("pointer: %p\n", &p) // pointer: 0x16D56B290

	// When formatting numbers you will often want to control the width and precision of the resulting figure.
	// To specify the width of an integer, use a number after the % in the verb.
	// By default the result will be right-justified and padded with 0.
	fmt.printf("width1: |%6d|%6d|\n", 12, 345) // width1: |000012|000345|

	// You can also specify the width of printed floats, though usually you’ll also want to restrict the decimal precision at the same time with the width.precision syntax.
	fmt.printf("width2: |%6.2f|%6.2f|\n", 1.2, 3.45) // width2: |001.20|003.45|

	// To left-justify, use the - flag.
	fmt.printf("width3: |%-6.2f|%-6.2f|\n", 1.2, 3.45) // width3: |1.2000|3.4500|

	// You may also want to control width when formatting strings, especially to ensure that they align in table-like output. For basic right-justified width.
	fmt.printf("width4: |%6s|%6s|\n", "foo", "b") // width4: |   foo|     b|

	// To left-justify use the - flag as with numbers.
	fmt.printf("width5: |%-6s|%-6s|\n", "foo", "b") // width5: |foo   |b     |

	// So far we’ve seen printf, which prints the formatted string to os.Stdout.
	// tprintf formats and returns a string without printing it anywhere.
	s := fmt.tprintf("tprintf: a %s", "string")
	fmt.println(s) // tprintf: a string

	// You can format+print to io.Writers other than os.stdout using fprintf.
	fmt.fprintf(os.stderr, "io: an %s\n", "error") // io: an error
}
