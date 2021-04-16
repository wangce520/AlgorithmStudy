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
    var count : Int = 0;
    
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

/// LRU



/// 判断是否为回文链表 1 2 3 4 5 6
func checkHuiWen(linkList : LinkList){
    // 先找到中间节点
    print("判断是否为回文链表")
    if linkList.headNode == nil || linkList.headNode?.next == nil || linkList.headNode?.value == linkList.headNode?.next?.value{
        print("是回文链表")
        return
    }
    
    var quickNode = linkList.headNode;
    var slowNode = linkList.headNode;
    while quickNode?.next?.next != nil{
        slowNode = slowNode?.next
        quickNode = quickNode?.next?.next
    }
    
    // 反转
    var preNode = slowNode
    var curNode = preNode?.next;
    while curNode != nil {
        let nextNode = curNode?.next;
        curNode?.next = preNode;
        preNode = curNode
        curNode = nextNode
    }
    
    slowNode?.next = nil;
    
    var node = linkList.headNode;
    while preNode != nil && node != nil{
        if node?.value != preNode?.value {
            print("不是回文链表")
            return
        }
        preNode = preNode?.next;
        node = node?.next
    }
    
    print("是回文链表")
}

/// 求链表的中间节点 1 2 3 4 5
func middleNode(linkList : LinkList){
    print("求链表的中间节点")
    if linkList.headNode == nil || linkList.headNode?.next == nil {
        print("当前链表的中间节点为：\(linkList.headNode!.value)")
        return
    }
    var quickNode = linkList.headNode;
    var slowNode = linkList.headNode;
    while quickNode != nil && quickNode?.next != nil{
        slowNode = slowNode?.next
        quickNode = quickNode?.next?.next
    }
    print("当前链表的中间节点为：\(slowNode!.value)")
}

/// 删除链表倒数第 n 个节点
func deleteNode(index : Int, linkList : LinkList) {
    print("删除链表倒数第 \(index) 个节点")
    // 需要先找到倒数第 n 个节点 1 2 3 4 n=2
    var quickNode = linkList.headNode;
    var cur = 1;
    while cur != index {
        if quickNode?.next == nil {
            print("超出数量限制")
            return;
        }
        quickNode = quickNode?.next;
        cur += 1
    }
    
    var node = LinkNode()
    node.next = linkList.headNode;
    var preNode = node;
    while quickNode?.next != nil {
        quickNode = quickNode?.next;
        preNode = preNode.next!
    }
    
    // 删除 slowNode
    preNode.next = preNode.next?.next;
    linkList.headNode = node.next;
    linkList.printLinkList()
}

/// 合并两个有序链表，递归解法
func mergeLinkList1(_ linkList1 : LinkList, _ linkList2 : LinkList) {
    linkList1.headNode = mergeLinkNode(linkList1.headNode, linkList2.headNode);
    linkList1.printLinkList();
}

func mergeLinkNode(_ linkNode1 : LinkNode?, _ linkNode2 : LinkNode?) -> LinkNode {
    if linkNode1 == nil {
        return linkNode2!
    }else if (linkNode2 == nil){
        return linkNode1!
    }else if(linkNode1!.value < linkNode2!.value){
        linkNode1?.next = mergeLinkNode(linkNode1!.next, linkNode2)
        return linkNode1!
    }else{
        linkNode2?.next = mergeLinkNode(linkNode1, linkNode2!.next);
        return linkNode2!
    }
}

/// 合并两个有序链表
func mergeLinkList(_ linkList1 : LinkList, _ linkList2 : LinkList) {
    // 合并两个有序链表
    let node = LinkNode()
    var preNode = node;
    preNode.value = 0;
    
    var node1 = linkList1.headNode;
    var node2 = linkList2.headNode;
    while node1 != nil && node2 != nil{
        if node1!.value > node2!.value {
            preNode.next = node2
            node2 = node2?.next
        }else{
            preNode.next = node1
            node1 = node1?.next
        }
        preNode = preNode.next!
    }
    
    linkList1.headNode = node.next;
    linkList1.printLinkList()
}

/// 判断链表是否有环
func cycleCheck(linkList : LinkList){
    // 构建环
    if linkList.isEmpty() {
        print("链表是空的")
        return
    }
    
    if linkList.headNode?.next == nil {
        print("只有一个，也不是循环链表")
        return
    }
    
    print("先构建一个循环链表");
    var node = linkList.headNode;
    while node?.next != nil {
        node = node?.next;
    }
    node?.next = linkList.headNode?.next;
    
    // 构建环完毕
//    linkList.printLinkList()
    
    // 判断环
    var slowNode = linkList.headNode;
    var quickNode = linkList.headNode?.next;
    // 当链表不存在环时，快指针将先到达尾部，所以可以用快指针判断是否循环一遍
    // 当链表存在环时，每一次循环，快指针和慢指针的距离-1
    while slowNode != quickNode {
        if quickNode == nil || quickNode?.next == nil {
            print("无环");
            return
        }
        slowNode = slowNode?.next
        quickNode = quickNode?.next?.next
    }
    print("有环")
}

/// 反转单链表，并输出
func reverseLinkList(linkList : LinkList){
    print("当前要反转的链表为：",terminator: "")
    linkList.printLinkList()
    
    // 常规算法，空间复杂度 O(1) 时间复杂度 O(n)
    if linkList.isEmpty() || linkList.headNode?.next == nil {
        print("链表为空，或者只有一个结点，则不需要反转")
        return;
    }

    var preNode : LinkNode? = nil;
    var curNode : LinkNode? = linkList.headNode;
    while curNode != nil {
        let node = curNode?.next;
        curNode?.next = preNode;
        preNode = curNode;
        curNode = node;
    }
    linkList.headNode = preNode;
    print("反转后的链表为：",terminator: "")
    linkList.printLinkList()
}

// 递归反转链表算法
func reverseLinkNode(linkNode : LinkNode?) -> LinkNode?{
    
    if(linkNode == nil || linkNode?.next == nil){
        return linkNode;
    }
    
    let node = reverseLinkNode(linkNode: linkNode?.next);
    linkNode?.next?.next = linkNode;
    linkNode?.next = nil;
    return node;
}

//1 - 2 - 3 - 4 - 5











func updateNode(node : LinkNode, linkList : LinkList) {
    let maxNodes = 5;
    if contaninNode(node: node, linkList: linkList) {
        // 找到node，将它移除，然后插入头部
        let headNode = LinkNode()
        headNode.next = linkList.headNode;
        var preNode = headNode;
        while preNode.next != nil {
            if preNode.next?.value ==  node.value{
                preNode.next = preNode.next?.next;
                break;
            }
            preNode = preNode.next!
        }
        
        // 插入到头部
        node.next = linkList.headNode;
        linkList.headNode = node;
        
    }else{
        // 不存在，直接插到头部
        node.next = linkList.headNode;
        linkList.headNode = node;
        linkList.count += 1;
        
        if linkList.count > maxNodes {
            // 如果>最大数量，那么移除最后一个，找到倒数第二个
            var curNode = linkList.headNode;
            while curNode?.next?.next != nil {
                curNode = curNode?.next
            }
            curNode?.next = nil;
            linkList.count -= 1;
        }
    }
    print("打印链表")
    linkList.printLinkList()
}

// 判断node是否存在
func contaninNode(node : LinkNode, linkList : LinkList) -> Bool {
    var curNode = linkList.headNode;
    while curNode != nil {
        if curNode?.value == node.value {
            return true
        }
        curNode = curNode?.next
    }
    return false
}
