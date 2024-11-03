package main

// Odin provides built-in support for base64 encoding/decoding.

// This syntax imports the encoding/base64 package with the b64 name instead of the default base64.
// It’ll save us some space below.
import b64 "core:encoding/base64"
import "core:fmt"

main :: proc() {
	// Here’s the string we’ll encode/decode.
	data := "abc123!?$*&()'-=@~"

	// Here’s how to encode using the standard encoder.
	// The encoder requires a []byte so we convert our string to that type.
	sEnc := b64.encode(transmute([]u8)data)
	fmt.println(sEnc) // YWJjMTIzIT8kKiYoKSctPUB+

	// Decoding may return an error, which you can check if you don’t already know the input to be well-formed.
	sDec, _ := b64.decode(sEnc)
	fmt.println(string(sDec)) // abc123!?$*&()'-=@~
}
