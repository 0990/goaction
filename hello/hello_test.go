package hello

import "testing"

func TestGreet(t *testing.T) {
	result := Greet()

	if result != "hello github actions" {
		t.Errorf("Greet() = %s; Expected hello github actions", result)
	}
}
