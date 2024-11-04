package main

// Say that you use the JSON loader to load a complicated thing such as a video game level.
// The level might contain strings, arrays etc, all which the JSON loader will separately allocate memory for.

// In order to make the unloading of all this dynamically allocated data easier, you can use an arena allocator.

import "core:encoding/json"
import "core:os"
// There are a couple of different arena allocators in core, here we will use the virtual memory growing allocator, which is the most flexible:
import vmem `core:mem/virtual`

// You then load the level from disk and unmarshal the JSON into it:
Level :: struct {
	name:    string,
	objects: []Game_Object,
	tiles:   []Tiles,
}

current_level: Level
current_level_arena: vmem.Arena

// load_level creates an arena and feeds json.unmarshal an allocator that can allocate memory into the arena.
// The virtual memory arena we’re using here can grow. When it grows it will allocate new blocks of memory.
// Internally in the arena, those blocks form a linked list so that the arena can keep track of all of them.
load_level :: proc(filename: string) {
	if json_data, ok := os.read_entire_file(filename, context.temp_allocator); ok {
		level: Level
		level_arena: vmem.Arena
		arena_allocator := vmem.arena_allocator(&level_arena)

		if json.unmarshal(json_data, &level, allocator = arena_allocator) == nil {
			// All the memory for the name, objects
			// and tiles fields inside `Level` will
			// be allocated on the arena.

			// Set some global variables
			// for the current level.
			current_level = level
			current_level_arena = level_arena
		}
	}
}

unload_level :: proc() {
	// This will free all the memory that was allocated while json.unmarshal ran, even though this memory is split into different fields of Level: name, objects and tiles.
	// If you had used the default allocator you would have had to free all of them separately.
	// This can be very useful in cases where you have a complicated tree of data with lots of lists and strings.
	vmem.arena_destroy(&current_level_arena)
	current_level = {}
}
