package main

import "core:fmt"
import "core:slice"

// Odin’s slice package implements sorting for builtins and user-defined types.
// We’ll look at sorting for builtins first.
main::proc() {
    // Sorting functions are generic, and work for any ordered built-in type.
    strs := []string{"c", "a", "b"}
    slice.sort(strs)
    fmt.println("Strings:", strs) // Strings: ["a", "b", "c"]

    // An example of sorting ints.
    ints := []int{7, 2, 4}
    slice.sort(ints)
    fmt.println("Ints:   ", ints) // Ints:    [2, 4, 7]

    // We can also use the slices package to check if a slice is already in sorted order.
    s := slice.is_sorted(ints)
    fmt.println("Sorted: ", s) // Sorted:  true
}
