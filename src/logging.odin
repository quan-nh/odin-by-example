package main

import "core:log"

// The Odin standard library provides straightforward tools for outputting logs from Odin programs,
// with the log package for free-form output.

main :: proc() {
	logger := log.create_console_logger()
	context.logger = logger

	// Rest of program goes here,
	// it will use context.logger whenever
	// you run `log.info`, `log.error` etc.
	log.info("Program started") // [INFO ] --- [2024-11-04 10:04:33] [logging.odin:15:main()] Program started

	// all_the_code_in_your_program()

	log.destroy_console_logger(logger)
}
