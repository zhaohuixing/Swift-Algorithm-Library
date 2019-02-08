
typealias CQueueInt = CQueue<Int>

let testQ : CQueueInt = CQueueInt()

testQ.Push_Back(value: 1)
testQ.Push_Back(value: 2)
testQ.Push_Back(value: 3)
testQ.Push_Back(value: 4)
testQ.Push_Back(value: 5)
testQ.Push_Back(value: 6)
testQ.Push_Back(value: 7)
testQ.Push_Back(value: 8)

print(testQ.Count())

while testQ.Empty() == false {
    let v = testQ.Front()
    print(v ?? "v is nil")
    let v2 = testQ.Pop_Front()
    print(v2 ?? "v2 is nil")
    print(testQ.Count())
    
}
