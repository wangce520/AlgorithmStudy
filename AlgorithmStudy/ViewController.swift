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
        self.arrayMethod()
        
        // 链表
        self.linkListMethod()
    }
    
    // 链表
    func linkListMethod() {
        
        // 创建链表
        let linkList = LinkList();
        
        // 尾插法
        linkList.insertNodeLast(value: 1)
        linkList.insertNodeLast(value: 2)
        linkList.insertNodeLast(value: 3)
        linkList.insertNodeLast(value: 4)
        linkList.insertNodeLast(value: 5)
        
        // 指定位置插入
//        linkList.insertNode(value: 0, index: 7)
        
        // 删除第一个节点
//        linkList.delFirstNode()
        
        // 删除最后一个节点
//        linkList.delLastNode();
        
        // 删除指定位置结点
        linkList.delNode(index: 5);
        
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

