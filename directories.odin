package main

import "core:fmt"
import "core:os"
import "core:path/filepath"

check :: proc(e: os.Error) {
	if e != nil {
		fmt.println(e)
		//panic("error")
	}
}

main :: proc() {
	// Create a new sub-directory in the current working directory.
	err := os.make_directory("subdir", 0755)
	check(err)

	// When creating temporary directories, it’s good practice to defer their removal. os.RemoveAll will delete a whole directory tree (similarly to rm -rf).
	//defer os.remove_directory("subdir")

	// Helper function to create a new empty file.
	createEmptyFile := proc(name: string) {
		st := ""
		d := transmute([]u8)st
		check(os.write_entire_file_or_err(name, d))
	}
	createEmptyFile("subdir/file1")

	// TODO
}
