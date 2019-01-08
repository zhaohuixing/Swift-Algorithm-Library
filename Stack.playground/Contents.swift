//import Cocoa

var str = "Hello, playground"

typealias CStackInt = CStack<Int>

let testStack : CStackInt = CStackInt()

testStack.Push(value: 1)
testStack.Push(value: 2)
testStack.Push(value: 3)
testStack.Push(value: 4)
testStack.Push(value: 5)
testStack.Push(value: 6)
testStack.Push(value: 7)
testStack.Push(value: 8)

while testStack.Empty() == false {
    let v = testStack.Peek()
    print(v ?? "v is nil")
    let v2 = testStack.Pop()
    print(v2 ?? "v2 is nil")

}

