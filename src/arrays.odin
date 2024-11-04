package main

import "core:fmt"

/*
In Odin, an array is a numbered sequence of elements of a specific length.
In typical Odin code, slices are much more common; arrays are useful in some special scenarios.
*/
main :: proc() {
	// Here we create an array a that will hold exactly 5 ints.
	// The type of elements and length are both part of the array’s type.
	//  By default an array is zero-valued, which for ints means 0s.
	a: [5]int
	fmt.println("emp:", a) // emp: [0, 0, 0, 0, 0]

	// We can set a value at an index using the array[index] = value syntax, and get a value with array[index]
	a[4] = 100
	fmt.println("set:", a)
	fmt.println("get:", a[4])

	// The builtin len returns the length of an array
	fmt.println("len:", len(a))

	// Use this syntax to declare and initialize an array in one line
	b := [5]int{1, 2, 3, 4, 5}
	fmt.println("dcl:", b)

	// You can also have the compiler count the number of elements for you with ?
	b = [?]int{1, 2, 3, 4, 5}
	fmt.println("dcl:", b)

	// Construct an array with designated initializers
	favorite_animals := [?]string {
		// Assign by index
		0 = "Raven",
		1 = "Zebra",
		2 = "Spider",
		// Assign by range of indices
		3 ..= 5  = "Frog",
		6 ..< 8  = "Cat",
	}
	fmt.println("idx:", favorite_animals)

	// Odin’s fixed length arrays support array programming
	Vector3 :: [3]f32
	x := Vector3{1, 4, 9}
	y := Vector3{2, 4, 8}
	z := x + y // {3, 8, 17}
	w := x * y // {2, 16, 72}
	e := z != w // true

	// Array types are one-dimensional, but you can compose types to build multi-dimensional data structures.
	twoD: [2][3]int
	for i in 0 ..< 2 {
		for j in 0 ..< 3 {
			twoD[i][j] = i + j
		}
	}
	fmt.println("2d: ", twoD) // 2d:  [[0, 1, 2], [1, 2, 3]]

	// You can create and initialize multi-dimensional arrays at once too
	twoD = [2][3]int{{1, 2, 3}, {1, 2, 3}}
	fmt.println("2d: ", twoD)

	//Note that arrays appear in the form [v1 v2 v3 ...] when printed with fmt.println.
}
