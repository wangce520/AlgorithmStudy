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
//        self.stackMethod()
        
        // 排序
//        self.sortMethod();
        
        // 树
        self.treeMethod()
        
    }
    
    // 树
    func treeMethod() {
        // 构建一棵树
        let rootNode = TreeNode(leftChild: nil, rightChild: nil, value: 0);
        let node1 = TreeNode(leftChild: nil, rightChild: nil, value: 1);
        let node2 = TreeNode(leftChild: nil, rightChild: nil, value: 2);
        let node3 = TreeNode(leftChild: nil, rightChild: nil, value: 3);
        let node4 = TreeNode(leftChild: nil, rightChild: nil, value: 4);
        let node5 = TreeNode(leftChild: nil, rightChild: nil, value: 5);
        let node6 = TreeNode(leftChild: nil, rightChild: nil, value: 6);
        let node7 = TreeNode(leftChild: nil, rightChild: nil, value: 7);
        let node8 = TreeNode(leftChild: nil, rightChild: nil, value: 8);
        rootNode.leftChild = node1;
        rootNode.rightChild = node2;
        node1.leftChild = node3;
        node1.rightChild = node4;
        node2.rightChild = node5;
        node3.leftChild = node6;
        node3.rightChild = node7;
        node4.leftChild = node8;
        
        //            0
        //        1       2
        //     3     4       5
        //   6   7 8
        
        // 前序遍历
//        preOrder1(rootNode: rootNode);
//        preOrder2(rootNode: rootNode);
        
        // 中序遍历
//        inOrder1(rootNode: rootNode)
//        inOrder2(rootNode: rootNode)
        
        // 后序遍历
//        postOrder1(rootNode: rootNode)
//        postOrder2(rootNode: rootNode)
        
        // 层序遍历
//        levelOrder(rootNode: rootNode)
        
        // 递归获取数的节点数
//        print("树中总的节点数为:\(treeNodeNumber(rootNode: rootNode))")
//        print("树中总的叶子节点数为:\(treeLeafNodeNumber1(rootNode: rootNode))")
//        print("树中总的叶子节点数为:\(treeLeafNodeNumber2(rootNode: rootNode))")
//        print("树的深度为:\(treeDepth(rootNode: rootNode))")
//        print("树中第3层结点的个数为:\(treeIndexLevelNodeNumber1(level : 3,rootNode: rootNode))")
//        print("树中第3层结点的个数为:\(treeIndexLevelNodeNumber2(level : 3,rootNode: rootNode))")

        // 判断两棵二叉树结构是否相同
//        print("两棵树结构是否相同:\(compareTwoTree(treeNode1: rootNode, treeNode2: rootNode))")

        // 反转二叉树，然后层序输出
//        reverseTree(rootNode: rootNode);
//        levelOrder(rootNode: rootNode)
    }
    
    // 排序
    func sortMethod() {
        let sort = Sort()
//        sort.maopao();
//        sort.charu();
        sort.selection()
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
//        cacluteResult()
    }
    
    // 链表
    func linkListMethod() {
        
        // 创建链表
//        let linkList = LinkList();
        
        // 测试头插法
//        linkList.insertHeadNode(value: 5);
//        linkList.insertHeadNode(value: 4);
//        linkList.insertHeadNode(value: 3);
//        linkList.insertHeadNode(value: 2);
//        linkList.insertHeadNode(value: 1);
//        linkList.printLinkList();
        
        // 测试尾插法
//        linkList.insertLastNode(value: 1)
//        linkList.insertLastNode(value: 2)
//        linkList.insertLastNode(value: 3)
//        linkList.insertLastNode(value: 4)
//        linkList.insertLastNode(value: 5)
//        linkList.printLinkList();
        
        // 测试指定位置插入 和 删除结点
//        // 插入
//        linkList.insertNode(value: 1, index: 1)
//        linkList.insertNode(value: 2, index: 2)
//        linkList.insertNode(value: 3, index: 3)
//        linkList.insertNode(value: 4, index: 4)
//        linkList.insertNode(value: 5, index: 5)
//        linkList.printLinkList();
//        // 删除倒数第几个结点
//        deleteLinkListNode(linkList: linkList, index: 5);
//        // 删除指定节点
//        linkList.deleteIndexNode(index: 3);
//        linkList.deleteIndexNode(index: 3);
//        linkList.printLinkList();
//        // 删除尾结点
//        linkList.deleteLastNode();
//        linkList.deleteLastNode();
//        linkList.printLinkList();
//        // 删除头结点
//        linkList.deleteFirstNode();
//        linkList.deleteFirstNode();
//        linkList.printLinkList();
//        // 获取指定下标的值，从1开始
//        print("第4的结点值为：\(linkList.getNodeValue(index: 4))")
//        // 获取指定值的下标，从1开始
//        print("值为2的结点下标为：\(linkList.getNodeIndex(value: 2))")
        
//        // 测试链表翻转
//        linkList.insertNode(value: 1, index: 1)
//        linkList.insertNode(value: 2, index: 2)
//        linkList.insertNode(value: 3, index: 3)
//        linkList.insertNode(value: 4, index: 4)
//        linkList.insertNode(value: 5, index: 5)
//        linkList.printLinkList();
//        // 非递归链表反转
//        reverseLinkList1(linkList: linkList);
//        // 递归链表反转
//        reverseLinkList2(linkList: linkList);
        
//        // 判断链表是否有环
//        linkList.insertNode(value: 1, index: 1)
//        linkList.insertNode(value: 2, index: 2)
//        linkList.insertNode(value: 3, index: 3)
//        linkList.insertNode(value: 4, index: 4)
//        linkList.insertNode(value: 5, index: 5)
//        // 构建环
//        linkList.buildCycle()
//        // 判断是否有环
//        print("链表是否有环：\(checkLinkListHasCycle(linkList: linkList))");
        
        // 合并两个有序链表
//        let linkList1 = LinkList()
//        linkList1.insertHeadNode(value: 9)
//        linkList1.insertHeadNode(value: 7)
//        linkList1.insertHeadNode(value: 5)
//        linkList1.insertHeadNode(value: 3)
//        linkList1.insertHeadNode(value: 1)
//
//        let linkList2 = LinkList()
//        linkList2.insertHeadNode(value: 10)
//        linkList2.insertHeadNode(value: 8)
//        linkList2.insertHeadNode(value: 6)
//        linkList2.insertHeadNode(value: 4)
//        linkList2.insertHeadNode(value: 2)
//        linkList2.printLinkList()
//        linkList1.printLinkList()
        // 合并两个有序链表，非递归
//        let resultList = mergeLinkList2(linkList1, linkList2)
//        resultList.printLinkList()
//        // 合并两个有序链表，递归
//        let resultList = mergeLinkList1(linkList1, linkList2)
//        resultList.printLinkList()
        
//        // 获取链表的中间结点
//        linkList.insertNode(value: 1, index: 1)
//        linkList.insertNode(value: 2, index: 2)
//        linkList.insertNode(value: 3, index: 3)
//        linkList.insertNode(value: 2, index: 3)
//        linkList.insertNode(value: 1, index: 4)
////        print("链表的中间结点值为：\(linkListMiddleNode(linkList: linkList))");
//        print("回文链表判断：\(checkLinkListHuiWen(linkList: linkList))");
    }

    // 数组
    func arrayMethod() {
        
        // 合并两个有序数组
        let arr1 = [1,3,5,7,9]
        let arr2 = [2,4,6,8,10]
        let result = mergeTwoArray(arr1: arr1, arr2: arr2);
        print("合并之后的数组为：\(result)")
    }
}

