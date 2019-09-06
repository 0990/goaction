package hello

import (
	"github.com/0990/goaction/hello/world"
)

func Greet() string {
	world.Say()
	//time.Sleep(time.Hour)
	return "hello github actions"
}
