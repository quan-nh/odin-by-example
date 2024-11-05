package main

import "core:fmt"
import "core:log"
import "core:net"
import "core:time"

import http "../odin-http"

main :: proc() {
	context.logger = log.create_console_logger(.Info)

	s: http.Server
	// Register a graceful shutdown when the program receives a SIGINT signal.
	http.server_shutdown_on_interrupt(&s)

	// Set up routing
	router: http.Router
	http.router_init(&router)
	defer http.router_destroy(&router)

	// Routes are tried in order.
	// Route matching is implemented using an implementation of Lua patterns, see the docs on them here:
	// https://www.lua.org/pil/20.2.html
	// They are very similar to regex patterns but a bit more limited, which makes them much easier to implement since Odin does not have a regex implementation.

	// Matches /users followed by any word (alphanumeric) followed by /comments and then / with any number.
	// The word is available as req.url_params[0], and the number as req.url_params[1].
	http.route_get(
		&router,
		"/users/(%w+)/comments/(%d+)",
		http.handler(proc(req: ^http.Request, res: ^http.Response) {
				http.respond_plain(
					res,
					fmt.tprintf("user %s, comment: %s", req.url_params[0], req.url_params[1]),
				)
			}),
	)
	http.route_get(&router, "/api", http.handler(api))
	http.route_get(&router, "/ping", http.handler(ping))
	http.route_get(&router, "/index", http.handler(index))

	// Matches every get request that did not match another route.
	http.route_get(&router, "(.*)", http.handler(static))

	routed := http.router_handler(&router)

	log.info("Listening on http://localhost:6969")

	err := http.listen_and_serve(&s, routed, net.Endpoint{address = net.IP4_Loopback, port = 6969})
	fmt.assertf(err == nil, "server stopped with error: %v", err)
}

api :: proc(req: ^http.Request, res: ^http.Response) {
	if err := http.respond_json(res, req.line); err != nil {
		log.errorf("could not respond with JSON: %s", err)
	}
}

ping :: proc(req: ^http.Request, res: ^http.Response) {
	http.respond_plain(res, "pong")
}

index :: proc(req: ^http.Request, res: ^http.Response) {
	http.respond_file(res, "examples/complete/static/index.html")
}

static :: proc(req: ^http.Request, res: ^http.Response) {
	http.respond_dir(res, "/", "examples/complete/static", req.url_params[0])
}
