package main

// In each scope, there is an implicit value named context. This context variable is local to each scope and is implicitly passed by pointer to any procedure call in that scope
// If you don’t want a proc to be fed the context you can write some_proc :: proc "contextless" () {}.

// The context is a struct that looks like this
/*
Context :: struct {
	allocator:              Allocator, // for “general” allocations
	temp_allocator:         Allocator, // for temporary and short lived allocations, which are to be freed once per cycle/frame/etc.
	assertion_failure_proc: Assertion_Failure_Proc,
	logger:                 Logger,

	user_ptr:   rawptr,
	user_index: int,

	// Internal use only
	_internal: rawptr,
}
*/

main :: proc() {
	c := context // copy the current scope's context
	context.user_index = 456

	{
		context.allocator = my_custom_allocator()
		context.user_index = 123
		supertramp() // the `context` for this scope is implicitly passed to `supertramp`
	}

	// `context` value is local to the scope it is in
	assert(context.user_index == 456)
}

supertramp :: proc() {
	c := context // this `context` is the same as the parent procedure that it was called from
	// From this example, context.user_index == 123
	// A context.allocator is assigned to the return value of `my_custom_allocator()`

	// The memory management procedure uses the `context.allocator` by default unless explicitly specified otherwise
	ptr := new(int)
	free(ptr)
}
