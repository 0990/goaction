package main

import (
	"fmt"
	"github.com/0990/goaction/hello"
	"github.com/sirupsen/logrus"
)

func main() {
	fmt.Println(hello.Greet())
	fmt.Print("hello")
	logrus.Info("fdsfsf")
}
