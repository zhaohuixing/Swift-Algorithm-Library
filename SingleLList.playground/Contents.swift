//import Cocoa

var str = "Hello, playground"

typealias CSingleLinkedListNodeInt = CSingleLinkedListNode<Int>

let node1 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 12)
let node2 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 28)
let node3 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 14)
let node4 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 15)
let node5 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 16)
let node6 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 17)
node2.next = node3;
node3.next = node4;
node4.next = node5;
node5.next = node6;
node1.next = node2;
let nodec6 = node6.clone()

print("LList node list")
var tempNode : CSingleLinkedListNodeInt? = node1
while tempNode != nil {
    print(tempNode!.data)
    tempNode = tempNode?.next
}

print(node1.next!.data!)
print((node1.data!))
print((node1.tail!.data!))
print((node1.tail!.next?.data!) ?? "nil object") //The "?? nil object" clause is for avoiding warning "Expression implicitly coerced from 'Int?' to 'Any'" by provding a default value to avoid this warning */
print((node1.tail!.next?.data!) as Any) //The "as Any" clause is for avoiding warning "Expression implicitly coerced from 'Int?' to 'Any'" by Explicitly casting to 'Any' with 'as Any' to silence this warning
//print((node1.tail!.next?.data!)!) //The last "!" clause is for avoiding warning "Expression implicitly coerced from 'Int?' to 'Any'" by Force-unwrapping the value to avoid this warning. But this gets execution exception: "error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)"
print((node1.tail!.next?.data!)) //This is sample of unwrapping warning
//print((node1.tail!.next!.data!)) //Exectuion exception: Fatal error: Unexpectedly found nil while unwrapping an Optional value

print(nodec6.data!)
let nodec1 = node1.clone()
print((nodec1.data!))
print((nodec1.tail!.data!))

typealias CSingleLinkedListInt = CSingleLinkedList<Int>
typealias STSingleLinkedListInt = STSingleLinkedList<Int>

let csllist1 = CSingleLinkedListInt(head:node1)
let cllhead = csllist1.head
print((cllhead?.data!) ?? "CSingleLinkedList head is nill") //If replace "cllhead?" with "cllhead!", then the execution exception will be thrown when cllhead is nill
print((cllhead?.tail!.data!) ?? "CSingleLinkedList tail is nill")
print((csllist1.tail!.data!))
print(csllist1.count)
print((csllist1[14]?.data) ?? "CSingleLinkedList [14] is not existed")
print((csllist1[914]?.data) ?? "CSingleLinkedList [914] is not existed")

csllist1.reverse()

print("LList node list")
tempNode = csllist1.head
while tempNode != nil {
    print(tempNode!.data)
    tempNode = tempNode?.next
}

csllist1.reverse2()

print("LList node list after reverse2")
tempNode = csllist1.head
while tempNode != nil {
    print(tempNode!.data)
    tempNode = tempNode?.next
}

print("End print LList node list after reverse2")

csllist1.reverseBetween(start:1, end: 5)

print("LList node list after reverseBetween")
tempNode = csllist1.head
while tempNode != nil {
    print(tempNode!.data)
    tempNode = tempNode?.next
}

print("End print LList node list after reverseBetween")


var ssllist1 = STSingleLinkedListInt(head:nodec1)
let sllhead = ssllist1.head
print((sllhead?.data!) ?? "STSingleLinkedList head is nill") //If replace "cllhead?" with "cllhead!", then the execution exception will be thrown when cllhead is nill
print((sllhead?.tail!.data!) ?? "STSingleLinkedList tail is nill")
print((ssllist1.tail!.data!))
print((ssllist1.count))
print((ssllist1[28]?.data) ?? "STSingleLinkedList [28] is not existed")
print((ssllist1[285]?.data) ?? "STSingleLinkedList [285] is not existed")

ssllist1.reverse()

print("\n\nstruct type LList node list not unwrapped with comiling warning, ouput as Optional(X)")
tempNode = ssllist1.head
while tempNode != nil {
    print(tempNode!.data)
    tempNode = tempNode?.next
}

print("\n\nstruct type LList node list unwrapped without compiling warning, outout no Optional(X)")
tempNode = ssllist1.head
while tempNode != nil {
    print(tempNode!.data!)
    tempNode = tempNode?.next
}

if csllist1.iscycled().retFlag == false {
   print("csllist1 is not cycled")
}
else {
   print("csllist1 is cycled")
}

let n1 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 12)
let n2 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 28)
let n3 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 14)
let n4 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 15)
let n5 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 16)
let n6 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 17)
n2.next = n3;
n3.next = n4;
n4.next = n5;
n5.next = n6;
n6.next = n3;
n1.next = n2;

let nR1 = n1.iscycled()
if nR1.retFlag == false {
    print("n1 is not cycled")
}
else {
    print("n1 is cycled")
    print("n1 cycled node: \(String(describing: nR1.cycleNode?.data))")
    print("n1 tail node: \(nR1.tailNode?.data ?? 0)")
}

let x1 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 12)
let x2 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 28)
let x3 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 14)
let x4 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 15)
let x5 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 16)
let x6 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 17)
x2.next = x3;
x3.next = x4;
x4.next = x5;
x5.next = x6;
x1.next = x2;

var xlist = CSingleLinkedListInt(head:x1)
print("XList node list before")

tempNode  = xlist.head
while tempNode != nil {
    print(tempNode!.data!)
    tempNode = tempNode?.next
}

let x0 : CSingleLinkedListNodeInt = CSingleLinkedListNodeInt(data: 6)
xlist.AddHead(head:x0)

print("XList node list Addhead without default value prvoided with compiling warning, output as Optional(X)")

tempNode  = xlist.head
while tempNode != nil {
    print(tempNode!.data)
    tempNode = tempNode?.next
}

print("XList node list Addhead with default value, output no Optional(X), no compiling warning")

tempNode  = xlist.head
while tempNode != nil {
    print(tempNode!.data ?? "Nil value reached")
    tempNode = tempNode?.next
}

xlist.RemoveHead()

print("XList node list RemoveHead")

tempNode  = xlist.head
while tempNode != nil {
    print(tempNode!.data)
    tempNode = tempNode?.next
}

