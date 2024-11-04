package main

import "core:fmt"
import "core:math/rand"

clamp :: proc(val, min, max: $T) -> T {
	if val <= min {
		return min
	}

	if val >= max {
		return max
	}

	return val
}

// create an array of random size
// Note that we cannot just type T: typeid in the parameter list,
// the $ has to be there so that the compiler knows we intend to use this value as a compile-time constant.
// You can have procs that have a parameter T: typeid, but then T would not be possible to use at compile-time.
// We need T to be usable at compile-time because we write []T further down, and []T is itself a type, which must be known at compile-time.
make_random_sized_slice :: proc($T: typeid, max_size: int) -> []T {
	random_size := rand.int31_max(i32(max_size))
	return make([]T, random_size)
}

// Similarly, we also put in $N: int, which gives us a compile-time value to use for the size of the items array.
Special_Array :: struct($T: typeid, $N: int) {
	items:          [N]T,
	num_items_used: int,
}

// You can also limit, or specialize, what types that are allowed
// In this case T must be a typeid that is a slice, but the item type of the slice is still generic.
make_slice :: proc($T: typeid/[]$E, len: int) -> T {
	return make(T, len)
}

main :: proc() {
	// clamp proc can be used for any numeric type
	fmt.println(clamp(1, 2, 3))
	fmt.println(clamp(1.0, 2.0, 3.0))

	my_slice := make_random_sized_slice(f32, 1000)

	array: Special_Array(f64, 128)
}
