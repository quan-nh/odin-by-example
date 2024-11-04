package main

import "core:fmt"
import "core:time"

main :: proc() {
	p := fmt.println

	// Here’s a basic example of formatting a time according to RFC3339, using the corresponding layout constant.
	t := time.now()
	res, _ := time.time_to_rfc3339(t)
	p(res) // 2024-11-02T13:14:48.306128Z

	// Time parsing uses the same layout values as Format.
	t1, e := time.rfc3339_to_time_utc("2012-11-01T22:08:41+00:00")
	p(t1) // 2012-11-01 22:08:41.000000000 +0000 UTC

	buf: [64]u8
	p(time.to_string_hms_12(t, buf[:])) // 01:19:25 pm
}
