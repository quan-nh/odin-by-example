package main

import "core:fmt"
import "core:time"

main :: proc() {
	p := fmt.println

	// We’ll start by getting the current time.
	now := time.now()
	p(now) // 2024-11-02 12:19:01.852345000 +0000 UTC

	// You can build a time struct by providing the year, month, day, etc.
	then, _ := time.datetime_to_time(2009, 11, 17, 20, 34, 58, 651387237)
	p(then) // 2009-11-17 20:34:58.651387237 +0000 UTC

	// You can extract the various components of the time value as expected.
	p(time.year(then)) // 2009
	p(time.month(then)) // November
	p(time.day(then)) // 17
	hour, min, sec, nanos := time.precise_clock_from_time(then)
	p(hour) // 20
	p(min) // 34
	p(sec) // 58
	p(nanos) // 651387237

	// The Monday-Sunday Weekday is also available.
	p(time.weekday(then)) // Tuesday

	// The diff methods returns a Duration representing the interval between two times.
	diff := time.diff(then, now)
	p(diff) // 131128h26m2.480086763s

	// We can compute the length of the duration in various units.
	p(time.duration_hours(diff)) // 131128.43402224634
	p(time.duration_minutes(diff)) // 7.867706041334779e+06
	p(time.duration_seconds(diff)) // 4.7206236248008674e+08
	p(time.duration_nanoseconds(diff)) // 472062362480086763

	// You can use Add to advance a time by a given duration, or with a - to move backwards by a duration.
	p(time.time_add(then, diff)) // 2024-11-02 13:03:29.273209000 +0000 UTC
	p(time.time_add(then, -diff)) // 1994-12-03 04:06:28.029565474 +0000 UTC
}
