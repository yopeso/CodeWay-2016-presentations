
func sayHello(string: String) {
  print("Hello \(string)!")
}

let x: (String) -> Void

x = sayHello

x("CodeWay")


