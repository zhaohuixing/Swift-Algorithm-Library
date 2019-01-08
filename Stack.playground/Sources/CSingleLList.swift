//
//  CSingleLList.swift
//  LinkList
//
//  Created by Zhaohui Xing on 10/26/18.
//  Copyright © 2018 Zhaohui Xing. All rights reserved.
//
import Foundation

//class base sll as reference type
public class CSingleLinkedList<T : Equatable> { //Equatable for ! operator in line#60
    var m_Head: CSingleLinkedListNode<T>?
    var m_Tail: CSingleLinkedListNode<T>?
    
    init() {
    }
    
    public init(head: CSingleLinkedListNode<T>) {
        self.m_Head = head
        self.m_Tail = self.m_Head?.tail
    }
}

extension CSingleLinkedList {
    public var head : CSingleLinkedListNode<T>? {
        get {
            return m_Head
        }
        set (newNode) {
            m_Head = newNode;
            m_Tail = newNode?.tail
        }
    }
}

extension CSingleLinkedList {
    public var tail : CSingleLinkedListNode<T>? {
        return m_Tail
    }
}

extension CSingleLinkedList {
    public var count : Int {
        var nCount : Int = 0
        var cur : CSingleLinkedListNode<T>? = m_Head
        
        while cur != nil {
            cur = cur?.next
            nCount += 1
        }
        
        return nCount
    }
}

extension CSingleLinkedList {
    public subscript (value : T) -> CSingleLinkedListNode<T>? {
        var cur : CSingleLinkedListNode<T>? = m_Head
        
        while cur != nil && cur!.data != value {
            cur = cur?.next
        }
        
        return cur
    }
}

extension CSingleLinkedList {
    public func reverse() {
        let prev : CSingleLinkedListNode<T>? = CSingleLinkedListNode<T>(); //This avoid the tail node is nil and while loop cannot go through all nodes
        prev?.next = m_Head   //prev.next as temperory head shifting cursor
        let cur : CSingleLinkedListNode<T>? = m_Head //Using cur.next as moving cursor, Note: this approach the orginal head's next is altered after the loop
        
        while cur?.next != nil {
            let temp: CSingleLinkedListNode<T>? = cur?.next
            cur?.next = temp?.next;
            temp?.next = prev?.next
            prev?.next = temp
        }
        m_Head = prev?.next
    }
}

extension CSingleLinkedList {
    public func reverse2() {
        let prev : CSingleLinkedListNode<T>? = CSingleLinkedListNode<T>(); //This avoid the tail node is nil and while loop cannot go through all nodes
        prev?.next = m_Head   //prev.next as temperory head shifting cursor
        var cur : CSingleLinkedListNode<T>? = m_Head?.next //Using cur as moving cursor
        
        while cur != nil {
            let temp: CSingleLinkedListNode<T>? = cur
            cur = temp?.next;
            temp?.next = prev?.next
            prev?.next = temp
        }
        m_Head?.next = nil;  //This one need this call, since using cur as moving cursor and orginal head.next is not altered
        m_Head = prev?.next
    }
}

extension CSingleLinkedList {
    public func iscycled()->(retFlag : Bool, cycleNode:CSingleLinkedListNode<T>?, tailNode:CSingleLinkedListNode<T>?) {
        var bRet : (retFlag : Bool, cycleNode:CSingleLinkedListNode<T>?, tailNode:CSingleLinkedListNode<T>?) = (false, nil, nil)
        
        if m_Head != nil {
            bRet = m_Head!.iscycled()
        }
        
        return bRet
    }
}

extension CSingleLinkedList {
    public func AddHead(head: CSingleLinkedListNode<T>) {
        head.next = m_Head;
        m_Head = head;
    }
}

extension CSingleLinkedList {
    public func RemoveHead() {
        m_Head = m_Head?.next;
    }
}

extension CSingleLinkedList {
    public func reverseBetween(start startIndex: Int, end endIndex: Int) {
        if endIndex <= startIndex {
            return
        }
        
        var cur : CSingleLinkedListNode<T>? = m_Head
        
        //tempPrev is the start node to swap sequence.
        var tempPrev : CSingleLinkedListNode<T>? //"?" allowing following calling "tempPrev = nil", otherwise compiling error for it
        tempPrev = nil

        let steps : Int = (0 < startIndex) ? startIndex-1 : 0
        for _ in 0...steps {
            if cur != nil {
                tempPrev = cur
                cur = cur?.next;
            }
        }
        if cur == nil {
            return
        }
        
        var tempHead: CSingleLinkedListNode<T>? = cur;
        
        
        for _ in startIndex...(endIndex-1) {
            if cur?.next != nil {
                let temp: CSingleLinkedListNode<T>? = cur?.next
                cur?.next = temp?.next;
                temp?.next = tempHead
                tempHead = temp
            }
        }
        
        if tempPrev != nil {
           tempPrev?.next = tempHead
        }
        else {
            m_Head = tempHead
        }

    }
}

