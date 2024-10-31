package main

import "core:fmt"
import "core:slice"

/*
Slices are an important data type in Odin, giving a more powerful interface to sequences than arrays.
*/
main :: proc() {

    // Unlike arrays, slices are typed only by the elements they contain (not the number of elements).
    // An uninitialized slice equals to nil and has length 0.
    s: []string
    fmt.println("uninit:", s, s == nil, len(s) == 0)

    // To create an empty slice with non-zero length, use the builtin make.
    // Here we make a slice of strings of length 3 (initially zero-valued).
    s = make([]string, 3)
    fmt.println("emp:", s, "len:", len(s))

    // We can set and get just like with arrays
    s[0] = "a"
    s[1] = "b"
    s[2] = "c"
    fmt.println("set:", s)
    fmt.println("get:", s[2])

    // len returns the length of the slice as expected.
    fmt.println("len:", len(s))

    // Slices support a “slice” operator with the syntax slice[low:high].
    // For example, this gets a slice of the elements s[1] and s[2]
    l := s[1:3]
    fmt.println("sl1:", l)

    // This slices up to (but excluding) s[2]
    l = s[:2]
    fmt.println("sl2:", l)

    // And this slices up from (and including) s[2]
    l = s[2:]
    fmt.println("sl3:", l)

    // we can declare and initialize a variable for slice in a single line as well
    t := []string{"g", "h", "i"}
    fmt.println("dcl:", t)

    // The slice package contains a number of useful utility functions for slices
    t2 := []string{"g", "h", "i"}
    if slice.equal(t, t2) {
        fmt.println("t == t2")
    }

    // slices can be composed into multi-dimensional data structures.
    // The length of the inner slices can vary, unlike with multi-dimensional arrays.
    twoD := make([][]int, 3)
    for i := 0; i < 3; i+=1 {
        innerLen := i + 1
        twoD[i] = make([]int, innerLen)
        for j := 0; j < innerLen; j+=1 {
            twoD[i][j] = i + j
        }
    }
    fmt.println("2d: ", twoD)

    // Dynamic arrays are similar to slices, but their lengths may change during runtime.
    x: [dynamic]int
    b := make([dynamic]int, 6)    // len(b) == 6, cap(b) == 6
    c := make([dynamic]int, 0, 6) // len(c) == 0, cap(c) == 6

    // It is common to append new elements to a dynamic array; this can be done using the built-in append proc.
    append(&x, 123)
    append(&x, 4, 1, 74, 3) // append multiple values at once
    fmt.println("apd:", x) // apd: [123, 4, 1, 74, 3]

    y: [dynamic]int
    append(&y, ..x[:]) // append a slice
    fmt.println("apd:", y) // apd: [123, 4, 1, 74, 3]

    // Slices and dynamic arrays can be deleted with the built-in delete proc.
    delete(s)
    delete(b)
    delete(c)
    // delete(t)                  // no need to clean up slice literals

    // Note: There is no automatic memory management in Odin.
}
//Note that while slices are different types than arrays, they are rendered similarly by fmt.println.
