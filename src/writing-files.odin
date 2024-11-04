package main

import "core:bufio"
import "core:fmt"
import "core:os"

// Writing files in Odin follows similar patterns to the ones we saw earlier for reading.
main :: proc() {
	// To start, here’s how to dump a string (or just bytes) into a file.
	st := "hello\nodin\n"
	d1 := transmute([]u8)st
	write_success := os.write_entire_file("/tmp/dat1", d1)
	fmt.println("success:", write_success) // success: true

	// For more granular writes, open a file for writing.
	fd, err := os.open("/tmp/dat2", os.O_WRONLY | os.O_CREATE | os.O_TRUNC, 0o644)
	if err != nil {
		fmt.println("Failed to open file for writing")
		return
	}
	// It’s idiomatic to defer a Close immediately after opening a file.
	defer os.close(fd)

	// You can Write byte slices as you’d expect.
	d2 := []u8{115, 111, 109, 101, 10}
	n2, _ := os.write(fd, d2)
	fmt.printf("wrote %d bytes\n", n2)

	// A WriteString is also available.
	n3, _ := os.write_string(fd, "writes\n")
	fmt.printf("wrote %d bytes\n", n3)

	// Issue a flush to flush writes to stable storage.
	os.flush(fd)

	// bufio provides buffered writers in addition to the buffered readers we saw earlier.
	w: bufio.Writer
	bufio.writer_init(&w, os.stream_from_handle(fd))
	n4, _ := bufio.writer_write_string(&w, "buffered\n")
	fmt.printf("wrote %d bytes\n", n4)

	// Use Flush to ensure all buffered operations have been applied to the underlying writer.
	bufio.writer_flush(&w)
}
