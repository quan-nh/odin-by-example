package main

import "core:fmt"
import "core:time"

// A common requirement in programs is getting the number of seconds, milliseconds, or nanoseconds since the Unix epoch.
// Here’s how to do it in Odin.

main :: proc() {
	// Use time.Now with Unix, UnixMilli or UnixNano to get elapsed time since the Unix epoch in seconds, milliseconds or nanoseconds, respectively.
	now := time.now()
	fmt.println(now) // 2024-11-02 13:09:52.275916000 +0000 UTC

	fmt.println(time.time_to_unix(now)) // to seconds: 1730552992
	fmt.println(time.time_to_unix_nano(now)) // 1730552992275916000

	// You can also convert integer seconds or nanoseconds since the epoch into the corresponding time.
	fmt.println(time.unix(time.time_to_unix(now), 0)) // 2024-11-02 13:09:52.000000000 +0000 UTC
	fmt.println(time.unix(0, time.time_to_unix_nano(now))) // 2024-11-02 13:09:52.275916000 +0000 UTC
}
