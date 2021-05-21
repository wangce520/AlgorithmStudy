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
    
    var _headNode : LinkNode? = nil
    
    // 判断链表是否为空
    func isEmpty() -> Bool {
        return _headNode == nil;
    }
    
    // 从头插入
    func insertHeadNode(value : Int) {
        let newHeadNode = LinkNode()
        newHeadNode.value = value;
        newHeadNode.next = _headNode;
        _headNode = newHeadNode;
    }
    
    // 从尾部插入
    func insertLastNode(value : Int) {
        let newLastNode = LinkNode()
        newLastNode.value = value;
        
        guard _headNode != nil else {
            _headNode = newLastNode;
            return;
        }
        
        // 先找到最后一个结点
        var curNode = _headNode!;
        while curNode.next != nil {
            curNode = curNode.next!;
        }
        
        // 插入最后
        curNode.next = newLastNode;
    }
    
    // 指定位置插入
    func insertNode(value:Int, index : Int) {
        let newNode = LinkNode()
        newNode.value = value;
        
        // 构建虚拟头结点
        let dummyPreNode = LinkNode()
        dummyPreNode.next = _headNode;
        
        var preNode = dummyPreNode;
        var indexx = 1;
        while indexx < index && preNode.next != nil{
            preNode = preNode.next!;
            indexx += 1;
        }
        
        newNode.next = preNode.next;
        preNode.next = newNode;
        _headNode = dummyPreNode.next;
    }
    
    // 删除指定下标位置的节点
    func deleteIndexNode(index : Int) {
        // 构建虚拟头结点
        let dummyPreNode = LinkNode()
        dummyPreNode.next = _headNode;
        
        var preNode = dummyPreNode;
        var indexx = 1;
        while indexx < index && preNode.next != nil{
            preNode = preNode.next!;
            indexx += 1;
        }
        
        preNode.next = preNode.next?.next;
        _headNode = dummyPreNode.next;
    }
    
    // 删除尾结点
    func deleteLastNode() {
        
        if isEmpty(){
            return;
        }
        
        if _headNode?.next == nil {
            _headNode = nil;
            return;
        }
        
        var curNode = _headNode;
        while curNode?.next?.next != nil{
            curNode = curNode?.next!;
        }
        curNode?.next = nil;
    }
    
    // 删除头结点
    func deleteFirstNode() -> Int {
        if isEmpty(){
            return -1;
        }
        let result = _headNode?.value;
        _headNode = _headNode?.next;
        return result!;
    }
    
    // 获取指定下标的值
    func getNodeValue(index : Int) -> Int {
        if isEmpty() {
            return -1;
        }
        var curNode = _headNode;
        var indexx = 1;
        while curNode?.next != nil && indexx < index {
            curNode = curNode?.next
            indexx += 1;
        }
        return curNode!.value
    }
    
    // 获取指定值的下标
    func getNodeIndex(value : Int) -> Int {
        if isEmpty() {
            return -1;
        }
        var curNode = _headNode;
        var indexx = 1;
        while curNode != nil && curNode?.value != value{
            curNode = curNode?.next;
            indexx += 1
        }
        
        return indexx
    }
    
    // 打印链表
    func printLinkList() {
        var curNode = _headNode;
        while curNode != nil {
            print("\(curNode!.value) -> ", terminator: "")
            curNode = curNode!.next;
        }
        print("nil")
    }
    
    // 获取链表数量
    func totalCount() -> Int {
        var node = _headNode;
        var result = 0;
        while node != nil {
            result += 1;
            node = node?.next;
        }
        return result;
    }
    
    // 构建环
    func buildCycle(){
        if isEmpty() {
            return
        }
        var curNode = _headNode;
        while curNode?.next != nil {
            curNode = curNode?.next;
        }
        curNode?.next = _headNode;
    }
}

/// 判断是否为回文链表 1 2 3 2 1
func checkLinkListHuiWen(linkList : LinkList) -> Bool {
    
    if linkList.isEmpty() {
        return false;
    }
    
    if linkList._headNode?.next == nil {
        return true
    }
    
    // 找到中间靠后的结点，并且翻转
    var slowNode = linkList._headNode;
    var quickNode = linkList._headNode;
    while quickNode?.next != nil {
        slowNode = slowNode?.next;
        quickNode = quickNode?.next?.next;
    }
    
    // slowNode为中间靠后结点，直接翻转
    var preNode : LinkNode? = nil
    var curNode = slowNode;
    while curNode != nil {
        let nextNode = curNode?.next;
        curNode?.next = preNode;
        preNode = curNode;
        curNode = nextNode;
    }
    
    // 对比
    var node = linkList._headNode;
    while preNode != nil && node != nil {
        if preNode?.value != node?.value {
            return false;
        }
        preNode = preNode?.next;
        node = node?.next;
    }
    return true
}

/// 求链表的中间节点 1 2 3 4 5
func linkListMiddleNode(linkList : LinkList) -> Int {
    
    if linkList.isEmpty() {
        return -1
    }
    
    if linkList._headNode?.next == nil {
        return linkList._headNode!.value
    }
    
    var slowNode = linkList._headNode;
    var quickNode = linkList._headNode;
    
    while quickNode != nil && quickNode?.next != nil{
        slowNode = slowNode?.next;
        quickNode = quickNode?.next?.next;
    }
    
    return (slowNode?.value)!
}

/// 删除链表倒数第n个结点 1 2 3 4 5
func deleteLinkListNode(linkList : LinkList, index : Int) {
    
    if linkList.isEmpty() {
        return;
    }
    let dummyPreNode = LinkNode()
    dummyPreNode.next = linkList._headNode;
    
    var slowNode = dummyPreNode;
    // 先找到第n个结点
    var quickNode = dummyPreNode.next;
    var indexx = 1;
    while indexx != index {
        if quickNode?.next == nil {
            print("超出数量限制")
            return
        }
        quickNode = quickNode?.next!;
        indexx += 1;
    }
    
    // 逐步加
    while quickNode!.next != nil {
        slowNode = slowNode.next!;
        quickNode = quickNode?.next!;
    }
    slowNode.next = slowNode.next?.next;
    linkList._headNode = dummyPreNode.next;
    linkList.printLinkList();
}

/// 合并两个有序链表，递归解法
func mergeLinkList1(_ linkList1 : LinkList, _ linkList2 : LinkList) -> LinkList{
    linkList1._headNode = mergeLinkNode(linkNode1: linkList1._headNode, linkNode2: linkList2._headNode);
    return linkList1
}

/// 合并两个有序链表，递归
func mergeLinkNode(linkNode1 : LinkNode?, linkNode2 : LinkNode?) -> LinkNode{
    if linkNode1 == nil && linkNode2 != nil{
        return linkNode2!
    }
    if linkNode2 == nil && linkNode1 != nil{
        return linkNode1!
    }
    if linkNode2!.value > linkNode1!.value {
        linkNode1!.next = mergeLinkNode(linkNode1: linkNode1?.next, linkNode2: linkNode2)
        return linkNode1!
    }else {
        linkNode2!.next = mergeLinkNode(linkNode1: linkNode1, linkNode2: linkNode2?.next)
        return linkNode2!
    }
}

/// 合并两个有序链表，非递归1
func mergeLinkList2(_ linkList1 : LinkList, _ linkList2 : LinkList) -> LinkList{
    if linkList1.isEmpty() {
        return linkList2
    }
    if linkList2.isEmpty() {
        return linkList1
    }
    let dummyNode = LinkNode()
    var preNode = dummyNode;
    var linkCurNode1 = linkList1._headNode;
    var linkCurNode2 = linkList2._headNode;
    while linkCurNode1 != nil || linkCurNode2 != nil{
        if linkCurNode1 == nil {
            preNode.next = linkCurNode2;
            linkCurNode2 = linkCurNode2?.next
        }else if linkCurNode2 == nil{
            preNode.next = linkCurNode1;
            linkCurNode1 = linkCurNode1?.next
        }else if (linkCurNode1?.value)! < (linkCurNode2?.value)!{
            preNode.next = linkCurNode1;
            linkCurNode1 = linkCurNode1?.next
        }else if (linkCurNode1?.value)! > (linkCurNode2?.value)!{
            preNode.next = linkCurNode2;
            linkCurNode2 = linkCurNode2?.next
        }
        preNode = preNode.next!;
    }
    linkList1._headNode = dummyNode.next;
    return linkList1;
}

/// 判断链表是否有环
func checkLinkListHasCycle(linkList : LinkList) -> Bool{
    
    if linkList.isEmpty() || linkList._headNode?.next == nil {
        return false
    }
    
    var slowNode = linkList._headNode;
    var quickNode = linkList._headNode?.next;
    while slowNode?.next != nil || quickNode?.next?.next != nil {
        if quickNode == slowNode{
            return true
        }
        slowNode = slowNode?.next;
        quickNode = quickNode?.next?.next;
    }
    return false
}

/// 反转单链表，并输出，非递归
func reverseLinkList1(linkList : LinkList){
    // 没有结点
    if linkList.isEmpty() {
        return;
    }

    print("反转后的链表为：");
    
    // 只有一个结点
    if linkList._headNode?.next == nil {
        linkList.printLinkList();
        return
    }
    
    var preNode : LinkNode? = nil;
    var curNode = linkList._headNode;
    while curNode != nil {
        let nextNode = curNode?.next;
        curNode?.next = preNode;
        preNode = curNode!;
        curNode = nextNode;
    }
    
    linkList._headNode = preNode;
    linkList.printLinkList();
}

// 递归反转链表算法
func reverseLinkList2(linkList : LinkList){
    if linkList.isEmpty() {
        return
    }
    linkList._headNode = reverseLinkNode(linkNode: linkList._headNode!);
    linkList.printLinkList()
}
func reverseLinkNode(linkNode : LinkNode) -> LinkNode {
    
    if linkNode.next == nil {
        return linkNode
    }
    
    let headNode = reverseLinkNode(linkNode: linkNode.next!);
    linkNode.next?.next = linkNode;
    linkNode.next = nil;
    return headNode;
}



