package main
import "core:fmt"
import "core:math"

s: string : "constant" // constant declaration with explicitly typed

main :: proc() {
	fmt.println(s)

	n :: 500000000 // untyped integer, will implicitly convert to any numeric type (int, u32, f64, quaternion128 etc)
	f :: 1.37 // untyped float,  will implicitly convert to any numeric type that can support fractional parts (f64, quaternion128 etc)

	d :: 3e20 / n // constant computations are possible
	fmt.println(d)

	fmt.println(math.sin(f32(n))) // math.sin expects a float
}
