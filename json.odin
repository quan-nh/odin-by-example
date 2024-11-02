package main

import "core:encoding/json"
import "core:fmt"
import "core:os"

// Odin offers built-in support for JSON encoding and decoding, including to and from built-in and custom data types.

// We’ll use these two structs to demonstrate encoding and decoding of custom types below.
response1 :: struct {
	Page:   int,
	Fruits: []string,
}

// Only exported fields will be encoded/decoded in JSON.
// Fields must start with capital letters to be exported.
response2 :: struct {
	Page:   int `json:"page"`,
	Fruits: []string `json:"fruits"`,
}

main :: proc() {
	// First we’ll look at encoding basic data types to JSON strings.
	// Here are some examples for atomic values.
	bolB, _ := json.marshal(true)
	fmt.println(string(bolB))

	intB, _ := json.marshal(1)
	fmt.println(string(intB))

	fltB, _ := json.marshal(2.34)
	fmt.println(string(fltB))

	strB, _ := json.marshal("gopher")
	fmt.println(string(strB))

	// And here are some for slices and maps, which encode to JSON arrays and objects as you’d expect.
	slcD := []string{"apple", "peach", "pear"}
	slcB, _ := json.marshal(slcD)
	fmt.println(string(slcB)) // ["apple","peach","pear"]

	mapD := map[string]int {
		"apple"   = 5,
		"lettuce" = 7,
	}
	mapB, _ := json.marshal(mapD)
	fmt.println(string(mapB)) // {"lettuce":7,"apple":5}

	// The JSON package can automatically encode your custom data types.
	// It will only include exported fields in the encoded output and will by default use those names as the JSON keys.
	res1D := response1 {
		Page   = 1,
		Fruits = []string{"apple", "peach", "pear"},
	}
	res1B, _ := json.marshal(res1D)
	fmt.println(string(res1B)) // {"Page":1,"Fruits":["apple","peach","pear"]}

	// You can use tags on struct field declarations to customize the encoded JSON key names.
	// Check the definition of response2 above to see an example of such tags.
	res2D := response2 {
		Page   = 1,
		Fruits = []string{"apple", "peach", "pear"},
	}
	res2B, _ := json.marshal(res2D)
	fmt.println(string(res2B)) // {"page":1,"fruits":["apple","peach","pear"]}

	// Now let’s look at decoding JSON data into Odin values.
	// Here’s an example for a generic data structure.
	s := `{"num":6.13,"strs":["a","b"]}`

	// We need to provide a variable where the JSON package can put the decoded data.
	// This map[string]any will hold a map of strings to arbitrary data types.

	dat: map[string]json.Value

	// Here’s the actual decoding, and a check for associated errors.
	if err := json.unmarshal_string(s, &dat); err != nil {
		fmt.println("Error:", err)
		return
	}
	defer delete(dat)
	fmt.println(dat) // map[num=6.1299999999999999, strs=["a", "b"]]

	// Access and handle different value types
	for key, value in dat {
		fmt.printf("Key: %s, ", key)

		switch v in value {
		case string:
			fmt.printf("String: %s\n", v)
		case i64:
			fmt.printf("Integer: %d\n", v)
		case f64:
			fmt.printf("Float: %f\n", v)
		case bool:
			fmt.printf("Boolean: %t\n", v)
		case json.Array:
			fmt.printf("Array: %v\n", v)
		case json.Object:
			fmt.printf("Object: %v\n", v)
		case json.Null:
			fmt.printf("Null\n")
		case:
			fmt.printf("Unknown type: %T\n", value)
		}
	}

	// We can also decode JSON into custom data types.
	// This has the advantages of adding additional type-safety to our programs and eliminating the need for type assertions when accessing the decoded data.
	str := `{"page": 1, "fruits": ["apple", "peach"]}`
	res := response2{}
	json.unmarshal_string(str, &res)
	fmt.println(res) // response2{Page = 1, Fruits = ["apple", "peach"]}
	fmt.println(res.Fruits[0]) // apple
}
