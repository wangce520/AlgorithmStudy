//
//  ViewController.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/4/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 数组相关方法
//        self.arrayMethod()
        
        // 链表
//        self.linkListMethod()
        
        // 栈相关方法
        self.stackMethod()
        
    }
    
    // 栈
    func stackMethod() {
//        let stack = Stack<Int>()
        // 栈的基本操作
//        stack.push(data: 1)
//        stack.push(data: 2)
//        stack.push(data: 3)
//
//        stack.pop();
        
        // 表达式求值
        cacluteResult()
    }
    
    // 链表
    func linkListMethod() {
        
        // 创建链表
        let linkList = LinkList();
        
        // 简易实现LRU
//        let node1 = LinkNode()
//        node1.value = 1;
//        updateNode(node: node1, linkList: linkList);
//
//        let node2 = LinkNode()
//        node2.value = 2;
//        updateNode(node: node2, linkList: linkList);
//
//        let node3 = LinkNode()
//        node3.value = 3;
//        updateNode(node: node3, linkList: linkList);
//
//        let node4 = LinkNode()
//        node4.value = 4;
//        updateNode(node: node4, linkList: linkList);
//
//        let node5 = LinkNode()
//        node5.value = 5;
//        updateNode(node: node5, linkList: linkList);
//
//        let node6 = LinkNode()
//        node6.value = 6;
//        updateNode(node: node6, linkList: linkList);
//
//        let node7 = LinkNode()
//        node7.value = 7;
//        updateNode(node: node7, linkList: linkList);
//
//        updateNode(node: node3, linkList: linkList);
        
        // 尾插法
//        linkList.insertNodeLast(value: 1)
//        linkList.insertNodeLast(value: 5)
//        linkList.insertNodeLast(value: 6)
//        linkList.insertNodeLast(value: 5)
//        linkList.insertNodeLast(value: 1)
        
//        linkList.insertNodeLast(value: 7)
//        linkList.insertNodeLast(value: 9)
//        linkList.insertNodeLast(value: 11)
//        linkList.insertNodeLast(value: 13)
        
//        deleteNode(index: 7, linkList: linkList);
        
//        middleNode(linkList: linkList)
        
//        checkHuiWen(linkList: linkList);
        
//        let linkList1 = LinkList();
//        // 尾插法
//        linkList1.insertNodeLast(value: 2)
//        linkList1.insertNodeLast(value: 4)
//        linkList1.insertNodeLast(value: 6)
//        linkList1.insertNodeLast(value: 8)
//        linkList1.insertNodeLast(value: 10)
//        linkList1.insertNodeLast(value: 12)
//        linkList1.insertNodeLast(value: 14)
//        mergeLinkList1(linkList, linkList1)
        
        // 反转链表,普通算法
//        reverseLinkList(linkList: linkList)
        // 反转链表，递归算法
//        linkList.headNode = reverseLinkNode(linkNode: linkList.headNode)
//        linkList.printLinkList()
        
        // 判断链表是否有环
//        cycleCheck(linkList : linkList);
        
        // 指定位置插入
//        linkList.insertNode(value: 0, index: 7)
        
        // 删除第一个节点
//        linkList.delFirstNode()
        
        // 删除最后一个节点
//        linkList.delLastNode();
        
        // 删除指定位置结点
//        linkList.delNode(index: 5);
        
        // 头插法
//        linkList.insertNodeFirst(value: 5);
//        linkList.insertNodeFirst(value: 4);
//        linkList.insertNodeFirst(value: 3);
//        linkList.insertNodeFirst(value: 2);
//        linkList.insertNodeFirst(value: 1);
    }

    // 数组
    func arrayMethod() {
        
        // 数组
//        let _ = CE_Array()
        
        // 两数之和
//        let _ = TwoSum();
        
        // 合并有序数组
//        let _ = ArrayMerge()
    }
}

