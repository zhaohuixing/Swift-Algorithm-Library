//
//  CStack.swift
//  A stack class implemented by single linkedin list class CSingleList
//
//  Created by Zhaohui Xing on 01/02/19.
//  Copyright © 2019 Zhaohui Xing. All rights reserved.
//
import Foundation

public class CStack<T : Equatable> {
    let m_Container: CSingleLinkedList<T>
    
    //Make default initializer public to be accessible
    public init() {
        m_Container = CSingleLinkedList()
    }
}

extension CStack {
    public func Push(value: T) {
        let newHead : CSingleLinkedListNode<T> = CSingleLinkedListNode<T>(data:value)
        m_Container.AddHead(head: newHead)
    }
}

extension CStack {
    public func Pop()->T? {
        var tempValue : T? //"?" allowing following calling "tempValue = nil", otherwise compiling error for it
        tempValue = nil
        
        if m_Container.head != nil {
            tempValue = m_Container.head?.data
            m_Container.RemoveHead()
        }
        
        return tempValue
    }
}

extension CStack {
    public func Peek()->T? {
        var tempValue : T? //"?" allowing following calling "tempValue = nil", otherwise compiling error for it
        tempValue = nil
        
        if m_Container.head != nil {
            tempValue = m_Container.head?.data
        }

        return tempValue
    }
}

extension CStack {
    public func Empty()->Bool {
        var ret : Bool = true
        
        if m_Container.head != nil {
            ret = false
        }
        return ret
    }
}
