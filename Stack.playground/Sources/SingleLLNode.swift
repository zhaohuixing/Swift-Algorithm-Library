//
//  SingleLList.swift
//  LinkList
//
//  Created by Zhaohui Xing on 10/26/18.
//  Copyright © 2018 Zhaohui Xing. All rights reserved.
//
import Foundation

public class CSingleLinkedListNode<T> {
    var m_Data: T?
    var m_Next: CSingleLinkedListNode<T>?
    var m_Hashvalue : Int64 //The hash value for hash table
    init() {
        let m : Int64 = Int64(INT_MAX)
        let v1 : Int64 = Int64.random(in: 0 ..< m)
        let v2 : Int64 = Int64.random(in: 0 ..< m)

        m_Hashvalue = v1 ^ v2
    }
    
    public init(data: T) {
        let m : Int64 = Int64(INT_MAX)
        let v1 : Int64 = Int64.random(in: 0 ..< m)
        let v2 : Int64 = Int64.random(in: 0 ..< m)
        m_Hashvalue = v1 ^ v2
        
        self.m_Data = data
    }
   
    public func clone()-> CSingleLinkedListNode<T> {
        let cloneNode : CSingleLinkedListNode<T> = CSingleLinkedListNode<T>(data: self.data!) //reference type "cloneNode", avoid "mutated warning for var"
        //cloneNode.next = ((m_Next!) ?? m_Next?.clone() , nil)
        /*guard let cloneNode.next = self.m_Next?.clone() else
        {
            print("Catched the source next nil")
            cloneNode.next = nil
        }*/
        if m_Next != nil
        {
            cloneNode.next = self.m_Next!.clone()
        }
        return cloneNode
    }
}

extension CSingleLinkedListNode {
    public var data : T? {
        return m_Data
    }
}

extension CSingleLinkedListNode {
    public var next : CSingleLinkedListNode<T>? {
        set (newNode) {
            m_Next = newNode
        }
        get {
            return m_Next
        }
    }
}

extension CSingleLinkedListNode {
    public var tail : CSingleLinkedListNode<T>? {
        let ret = iscycled()
        if ret.retFlag {
            return ret.tailNode
        }
        else {
            if m_Next != nil {
                if m_Next?.tail != nil {
                    return m_Next?.tail
                }
                else {
                    return m_Next
                }
            }
            else {
                return self;
            }
        }
    }
}

extension CSingleLinkedListNode { //: Hashable {
    public var hashValue: Int64 {
        return m_Hashvalue
    }
}


extension CSingleLinkedListNode {
    public func iscycled()->(retFlag : Bool, cycleNode:CSingleLinkedListNode?, tailNode:CSingleLinkedListNode?) {
        var bRet : Bool = false
        var cycleNode:CSingleLinkedListNode?
        var tailNode:CSingleLinkedListNode?
        
        var hashLut = [Int64: CSingleLinkedListNode]() //hash table by Dictionary
        var cur : CSingleLinkedListNode<T>? = self;

        cycleNode = nil
        tailNode = nil

        while cur != nil {
            if cur!.next != nil && hashLut[cur!.next!.hashValue] != nil {
                cycleNode = cur!.next!
                tailNode = cur!
                bRet = true
                break
            }
            hashLut[cur!.hashValue] = cur
            cur = cur!.next
        }
        
    return (bRet, cycleNode, tailNode);
    }
}


