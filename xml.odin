package main

import "core:encoding/xml"
import "core:fmt"

// Odin offers built-in support for XML and XML-like formats with the encoding/xml package.

// Plant will be mapped to XML.
// Similarly to the JSON examples, field tags contain directives for the encoder and decoder.
// Here we use some special features of the XML package:
//  the XMLName field name dictates the name of the XML element representing this struct;
//  id,attr means that the Id field is an XML attribute rather than a nested element.
Plant :: struct {
	//XMLName: xml.Name `xml:"plant"`,
	Id:     int `xml:"id,attr"`,
	Name:   string `xml:"name"`,
	Origin: []string `xml:"origin"`,
}

main :: proc() {
	coffee := &Plant{Id = 27, Name = "Coffee"}
	coffee.Origin = []string{"Ethiopia", "Brazil"}

	// TODO
}
