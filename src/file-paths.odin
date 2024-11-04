package main

import "core:fmt"
import "core:path/filepath"
import "core:strings"

// The filepath package provides functions to parse and construct file paths in a way that is portable between operating systems;
// dir/file on Linux vs. dir\file on Windows, for example.

main :: proc() {
	// Join should be used to construct paths in a portable way.
	// It takes any number of arguments and constructs a hierarchical path from them.
	p := filepath.join({"dir1", "dir2", "filename"})
	fmt.println("p:", p) // p: dir1/dir2/filename

	// You should always use Join instead of concatenating /s or \s manually.
	// In addition to providing portability, Join will also normalize paths by removing superfluous separators and directory changes.
	fmt.println(filepath.join({"dir1//", "filename"})) // dir1/filename
	fmt.println(filepath.join({"dir1/../dir1", "filename"})) // dir1/filename

	// Dir and Base can be used to split a path to the directory and the file.
	// Alternatively, Split will return both in the same call.
	fmt.println("Dir(p):", filepath.dir(p)) // dir1/dir2
	fmt.println("Base(p):", filepath.base(p)) // filename

	// We can check whether a path is absolute.
	fmt.println(filepath.is_abs("dir/file")) // false
	fmt.println(filepath.is_abs("/dir/file")) // true

	filename := "config.json"
	// Some file names have extensions following a dot.
	// We can split the extension out of such names with Ext.
	ext := filepath.ext(filename)
	fmt.println(ext) // .json

	// To find the file’s name with the extension removed, use strings.trim_suffix.
	fmt.println(strings.trim_suffix(filename, ext)) // config

	// Rel finds a relative path between a base and a target.
	// It returns an error if the target cannot be made relative to base.
	rel, err := filepath.rel("a/b", "a/b/t/file")
	if err != nil {
		fmt.println(err)
		return
	}
	fmt.println(rel) // t/file
	rel, err = filepath.rel("a/b", "a/c/t/file")
	if err != nil {
		fmt.println(err)
		return
	}
	fmt.println(rel) // ../c/t/file
}
