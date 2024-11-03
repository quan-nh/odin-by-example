package main

import "core:bufio"
import "core:fmt"
import "core:os"

// Reading and writing files are basic tasks needed for many Odin programs.
// First we’ll look at some examples of reading files.

/*
$ echo "hello" > /tmp/dat
$ echo "odin" >>   /tmp/dat
$ odin run reading-files.odin -file
*/
main :: proc() {
	// Perhaps the most basic file reading task is slurping a file’s entire contents into memory.
	dat, _ := os.read_entire_file_from_filename("/tmp/dat")
	fmt.print(string(dat))

	// You’ll often want more control over how and what parts of a file are read.
	// For these tasks, start by Opening a file to obtain an os.File value.
	f, err := os.open("/tmp/dat")

	// Read some bytes from the beginning of the file.
	// Allow up to 5 to be read but also note how many actually were read.
	b1 := make([]u8, 5)
	n1, _ := os.read(f, b1)
	fmt.printf("%d bytes: %s\n", n1, string(b1[:n1])) // 5 bytes: hello

	// You can also Seek to a known location in the file and Read from there.
	o2, _ := os.seek(f, 6, os.SEEK_SET)
	b2 := make([]u8, 4)
	n2, _ := os.read(f, b2)
	fmt.printf("%d bytes @ %d: ", n2, o2)
	fmt.printf("%v\n", string(b2[:n2])) // 4 bytes @ 6: odin

	// There is no built-in rewind, but Seek(0, io.SeekStart) accomplishes this.
	os.seek(f, 0, os.SEEK_SET)

	// The bufio package implements a buffered reader that may be useful both for its efficiency with many small reads and because of the additional reading methods it provides.
	r4: bufio.Reader
	bufio.reader_init(&r4, os.stream_from_handle(f))
	b4, _ := bufio.reader_peek(&r4, 5)
	fmt.printf("5 bytes: %s\n", string(b4)) // 5 bytes: hello

	// Close the file when you’re done (usually this would be scheduled immediately after Opening with defer).
	os.close(f)
}
