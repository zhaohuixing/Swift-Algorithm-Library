//
//  CQueue.swift
//  A queue class implemented by single linkedin list class CSingleList
//
//  Created by Zhaohui Xing on 02/06/19.
//  Copyright © 2019 Zhaohui Xing. All rights reserved.
//

import Foundation

public class CQueue<T : Equatable> {
    let m_Container: CSingleLinkedList<T>
    
    //Make default initializer public to be accessible
    public init() {
        m_Container = CSingleLinkedList()
    }
}

extension CQueue {
    public func Push_Back(value: T) {
        let newNode : CSingleLinkedListNode<T> = CSingleLinkedListNode<T>(data:value)
        m_Container.Append(value: newNode)
    }
}

extension CQueue {
    public func Pop_Front()->T? {
        var tempValue : T?
        tempValue = nil
        
        if m_Container.head != nil {
            tempValue = m_Container.head?.data
            m_Container.RemoveHead()
        }
        
        return tempValue
    }
}

extension CQueue {
    public func Front()->T? {
        var tempValue : T?
        tempValue = nil
        
        if m_Container.head != nil {
            tempValue = m_Container.head?.data
        }
        
        return tempValue
    }
}

extension CQueue {
    public func Empty()->Bool {
        var ret : Bool = true
        
        if m_Container.head != nil {
            ret = false
        }
        return ret
    }
}

extension CQueue {
    public func Count()->Int {
        let ret : Int = m_Container.count
        return ret
    }
}
