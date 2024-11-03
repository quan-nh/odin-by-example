package main
import "core:fmt"
import "core:mem"

basic_stuff :: proc() {
	// 1. Basic allocation/deallocation
	{
		// Allocate memory
		data := new(int) // Allocates an int on the heap
		data^ = 42
		fmt.println("Value:", data^)

		// Free memory
		free(data) // Must free manually
	}

	// 2. Using defer for cleanup
	{
		data := new(int)
		defer free(data) // Will be freed when scope ends

		data^ = 42
		fmt.println("Value:", data^)
	}

	// Deliberately leak memory by not freeing
	data := new(int)

	// 3. Slice allocation
	{
		// Allocate slice
		slice := make([]int, 5)
		defer delete(slice) // Clean up slice

		slice[0] = 1
		fmt.println("Slice:", slice)
	}

	slice1 := []int{1, 2, 3} // a slice literal
	// delete(slice1)                  // no need to clean up slice literals

	// 4. Dynamic array
	{
		array := make([dynamic]int)
		defer delete(array) // Clean up dynamic array

		append(&array, 1)
		append(&array, 2)
		fmt.println("Dynamic array:", array)
	}

	{
		x: [dynamic]int
		defer delete(x)

		append(&x, 123)
		fmt.println("Dynamic array:", x)
	}

	// 5. Map allocation
	{
		m := make(map[string]int)
		defer delete(m) // Clean up map

		m["key"] = 42
		fmt.println("Map:", m)
	}

	{
		n := map[string]int {
			"foo" = 1,
			"bar" = 2,
		}
		defer delete(n)
		fmt.println("map:", n)
	}
}

// 8. Custom type with cleanup
Thing :: struct {
	data: []int,
	name: string,
}

destroy_thing :: proc(t: ^Thing) {
	if t == nil do return
	delete(t.data)
	// String is not owned, no need to delete
	free(t)
}

make_thing :: proc() -> ^Thing {
	t := new(Thing)
	t.data = make([]int, 5)
	t.name = "thing"
	return t
}

// Usage of custom type
thing_example :: proc() {
	thing := make_thing()
	defer destroy_thing(thing)

	thing.data[0] = 42
	fmt.println("Thing:", thing^)
}

// run with -debug option
main :: proc() {
	when ODIN_DEBUG {
		track: mem.Tracking_Allocator
		mem.tracking_allocator_init(&track, context.allocator)
		context.allocator = mem.tracking_allocator(&track)

		defer {
			if len(track.allocation_map) > 0 {
				fmt.eprintf("=== %v allocations not freed: ===\n", len(track.allocation_map))
				for _, entry in track.allocation_map {
					fmt.eprintf("- %v bytes @ %v\n", entry.size, entry.location)
				}
			}
			if len(track.bad_free_array) > 0 {
				fmt.eprintf("=== %v incorrect frees: ===\n", len(track.bad_free_array))
				for entry in track.bad_free_array {
					fmt.eprintf("- %p @ %v\n", entry.memory, entry.location)
				}
			}
			mem.tracking_allocator_destroy(&track)
		}
	}

	basic_stuff()
	thing_example()
}
