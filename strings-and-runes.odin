package main

import "core:fmt"
import "core:unicode/utf8"

main :: proc() {
	// s is a string assigned a literal value representing the word “hello” in the Thai language.
	// Odin string literals are UTF-8 encoded text.
	s := "สวัสดี"

	// Since strings are equivalent to []byte, this will produce the length of the raw bytes stored within.
	fmt.println("Len:", len(s)) // Len: 18

	// Indexing into a string produces the raw byte values at each index.
	// This loop generates the hex values of all the bytes that constitute the code points in s.
	for i := 0; i < len(s); i += 1 {
		fmt.printf("%x ", s[i])
	}
	fmt.println() // e0 b8 aa e0 b8 a7 e0 b8 b1 e0 b8 aa e0 b8 94 e0 b8 b5

	// To count how many runes are in a string, we can use the utf8 package.
	// Note that the run-time of RuneCountInString depends on the size of the string, because it has to decode each UTF-8 rune sequentially.
	// Some Thai characters are represented by UTF-8 code points that can span multiple bytes, so the result of this count may be surprising.
	fmt.println("Rune count:", utf8.rune_count_in_string(s)) // Rune count: 6

	// A range loop handles strings specially and decodes each rune along with its offset in the string.
	for runeValue, idx in s {
		fmt.printf("%#U starts at %d\n", runeValue, idx)
	}
	// U+0xE2A starts at 0
	// U+0xE27 starts at 3
	// U+0xE31 starts at 6
	// U+0xE2A starts at 9
	// U+0xE14 starts at 12
	// U+0xE35 starts at 15

	// We can achieve the same iteration by using the utf8.decode_rune_in_string function explicitly.
	fmt.println("\nUsing decode_rune_in_string")
	for i, w := 0, 0; i < len(s); i += w {
		runeValue, width := utf8.decode_rune_in_string(s[i:])
		fmt.printf("%#U starts at %d\n", runeValue, i)
		w = width

		// This demonstrates passing a rune value to a function.
		examineRune(runeValue)
	}
}

examineRune :: proc(r: rune) {
	// Values enclosed in single quotes are rune literals.
	// We can compare a rune value to a rune literal directly.
	if r == 't' {
		fmt.println("found tee")
	} else if r == 'ส' {
		fmt.println("found so sua")
	}
}
