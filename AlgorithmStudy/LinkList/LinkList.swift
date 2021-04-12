//
//  LinkList.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/4/11.
//

import Foundation

class LinkNode : NSObject {
    var value : Int = 0;
    var next : LinkNode? = nil
}

class LinkList : NSObject {
    var headNode : LinkNode? = nil
    
    // 判断链表是否为空
    func isEmpty() -> Bool {
        return headNode == nil;
    }
    
    // 删除指定位置的节点
    func delNode(index : Int) {
        // 如果没有有一个节点
        if self.isEmpty() {
            print("当前链表是空的，无需删除")
            return
        }
        
        let firstNode = LinkNode()
        firstNode.next = self.headNode;
        
        var curIndex = 1;
        var curNode : LinkNode? = firstNode;
        while curNode?.next != nil {
            if curIndex == index {
                print("删除节点成功，值为\(curNode!.next!.value)")
                curNode?.next = curNode?.next?.next;
                self.headNode = firstNode.next;
                printLinkList()
                return;
            }
            curNode = curNode?.next;
            curIndex += 1
        }
        print("删除时超出范围")
    }
    
    // 删除尾结点
    func delLastNode() {
        // 如果没有有一个节点
        if self.isEmpty() {
            print("当前链表是空的，无需删除")
            return
        }
        // 如果只有一个节点
        if self.headNode?.next == nil {
            print("只有一个结点，删除成功")
            self.headNode = nil
            printLinkList()
            return
        }
        
        // 获取倒数第一个节点
        var curNode = self.headNode;
        while curNode?.next?.next != nil {
            curNode = curNode?.next
        }
        
        print("删除节点成功，值为\(curNode!.value)")
        curNode?.next = nil;
        printLinkList()
    }
    
    // 删除头结点
    func delFirstNode() {
        // 如果没有有一个节点
        if self.isEmpty() {
            print("当前链表是空的，无需删除")
            return
        }
        // 如果只有一个节点
        if self.headNode?.next == nil {
            print("只有一个结点，删除成功")
            self.headNode = nil
            printLinkList()
            return
        }
        
        print("删除节点成功，值为\(self.headNode!.value)")
        self.headNode = self.headNode?.next;
        printLinkList()
        
    }
    
    // 头插法插入链表
    func insertNodeFirst(value:Int) {
        print("头插法插入结点，值为：\(value)")
        let node = LinkNode()
        node.value = value;
        node.next = headNode;
        self.headNode = node;
        printLinkList();
    }
    
    // 尾插法插入链表
    func insertNodeLast(value : Int){
        print("尾插法插入结点，值为：\(value)")
        
        let newNode = LinkNode()
        newNode.value = value;
        
        // 如果头结点就为nil，则直接赋值
        guard self.headNode != nil else {
            self.headNode = newNode;
            printLinkList()
            return;
        }
        
        var node = self.headNode;
        while node?.next != nil {
            node = node?.next
        }
        node?.next = newNode
        printLinkList()
    }
    
    // 指定位置插入链表
    func insertNode(value : Int, index : Int) {
        print("指定位置插入，值为\(value)")
        let newNode = LinkNode()
        newNode.value = value;
        
        // 另加头结点的方法，这样一来就不用对第一个做判断了
        let firstNode = LinkNode()
        firstNode.value = 0;
        firstNode.next = self.headNode;
        
        var curIndex = 1;
        var curNode : LinkNode? = firstNode;
        while curNode != nil{
            if curIndex == index {
                newNode.next = curNode?.next;
                curNode?.next = newNode;
                self.headNode = firstNode.next;
                printLinkList()
                return
            }
            curIndex += 1
            curNode = curNode?.next
        }
        
        
        // 普通方法
        // 如果插入的是第一个位置
//        guard index > 1 else {
//            newNode.next = self.headNode;
//            self.headNode = newNode;
//            printLinkList()
//            return
//        }
//
//        // 如果插入的是别的位置
//        var curIndex = 1;
//        var curNode = self.headNode;
//        while curNode != nil {
//            if curIndex == index - 1 {
//                newNode.next = curNode?.next;
//                curNode?.next = newNode
//                printLinkList()
//                return
//            }
//            curIndex += 1
//            curNode = curNode?.next
//        }
        print("插入时超出范围")
    }
    
    // 打印链表
    func printLinkList() {
        guard headNode != nil else {
            print("当前链表为空")
            return
        }
        
        var curNode = headNode;
        while curNode != nil {
            if curNode!.next == nil {
                print("\(curNode!.value)")
            }else{
                print("\(curNode!.value) -> ",terminator: "")
            }
            curNode = curNode?.next
        }
    }
}


/// 判断链表是否有环

/// 反转单链表


