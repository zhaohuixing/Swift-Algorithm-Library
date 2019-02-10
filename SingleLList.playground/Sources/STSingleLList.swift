//
//  CSingleLList.swift
//  LinkList
//
//  Created by Zhaohui Xing on 10/26/18.
//  Copyright © 2018 Zhaohui Xing. All rights reserved.
//
import Foundation

//structure base sll as value type
public struct STSingleLinkedList<T : Equatable> { //Equatable for ! operator in line#60
    var m_Head: CSingleLinkedListNode<T>?
    var m_Tail: CSingleLinkedListNode<T>?
    
    init() {
    }
    
    public init(head: CSingleLinkedListNode<T>) {
        self.m_Head = head
        self.m_Tail = self.m_Head?.tail
    }
    
}

extension STSingleLinkedList {
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

extension STSingleLinkedList {
    public var tail : CSingleLinkedListNode<T>? {
        return m_Tail
    }
}

extension STSingleLinkedList {
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

extension STSingleLinkedList {
    public subscript (value : T) -> CSingleLinkedListNode<T>? {
        var cur : CSingleLinkedListNode<T>? = m_Head
        while cur != nil && cur!.data != value {
            cur = cur?.next
        }
        
        return cur
    }
}

extension STSingleLinkedList {
    //The mutating avoids compiling error of "cannot assign to property 'self' is immutable" in line #81 code, because structure is value type!
    public mutating func reverse() {
        let prev : CSingleLinkedListNode<T>? = CSingleLinkedListNode<T>(); //This avoid the tail node is nil and while loop cannot go through all nodes
        prev?.next = m_Head   //prev.next as temperory head shifting cursor
        var cur : CSingleLinkedListNode<T>? = m_Head?.next //Using cur  as moving cursor
        
        while cur != nil {
            let temp: CSingleLinkedListNode<T>? = cur
            cur = temp?.next;
            temp?.next = prev?.next
            prev?.next = temp
        }
        m_Head?.next = nil; //This one need this call, since using cur as moving cursor and orginal head.next is not altered
        m_Head = prev?.next //This code does not work for struct (value type) (but work for class (reference type)) without "mutating"
    }
}


