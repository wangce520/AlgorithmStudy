//
//  Tree.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/5/19.
//

import UIKit

class TreeNode : NSObject {
    var leftChild : TreeNode?
    var rightChild : TreeNode?
    var value : Int = 0;
    
    init(leftChild : TreeNode?, rightChild : TreeNode?, value : Int) {
        super.init()
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.value = value
    }
}



//求任意两结点距离；

//求两个结点的最低公共祖先结点
//func minParentNode(treeNode1:TreeNode?, treeNode2 : TreeNode?) -> TreeNode {
//    
//}

//求二叉树的镜像；
func reverseTree(rootNode : TreeNode?)  {
    if rootNode == nil {
        return;
    }
    let node = rootNode?.leftChild;
    rootNode?.leftChild = rootNode?.rightChild;
    rootNode?.rightChild = node;
    reverseTree(rootNode: rootNode?.leftChild)
    reverseTree(rootNode: rootNode?.rightChild)
}

/// 判断两棵二叉树是否结构相同
func compareTwoTree(treeNode1 : TreeNode?, treeNode2 : TreeNode?) -> Bool{
    if treeNode1 == nil && treeNode2 == nil {
        return true
    }else if treeNode1 == nil || treeNode2 == nil {
        return false;
    }
    
    return compareTwoTree(treeNode1: treeNode1?.leftChild, treeNode2: treeNode2?.leftChild) && compareTwoTree(treeNode1: treeNode1?.rightChild, treeNode2: treeNode2?.rightChild)
}

/// 求二叉树第k层的结点个数，递归法
func treeIndexLevelNodeNumber1(level : Int, rootNode : TreeNode?) -> Int {
    if rootNode == nil {
        return 0;
    }
    if level == 1 {
        return 1;
    }
    return treeIndexLevelNodeNumber1(level: level - 1, rootNode: rootNode?.leftChild) + treeIndexLevelNodeNumber1(level: level - 1, rootNode: rootNode?.rightChild)
}

/// 求二叉树第k层的结点个数，非递归法
func treeIndexLevelNodeNumber2(level : Int, rootNode : TreeNode?) -> Int {
    if rootNode == nil {
        return 0;
    }
    let queue = Queue<TreeNode>()
    var curLevel = 0;
    queue.enque(data: rootNode!)
    while !queue.isEmpty() {
        curLevel += 1;
        let count = queue.count();
        var index = 0;
        if curLevel == level {
            return queue.count()
        }
        while index < count {
            let node = queue.deque();
            if node.leftChild != nil {
                queue.enque(data: node.leftChild!)
            }
            if node.rightChild != nil {
                queue.enque(data: node.rightChild!)
            }
            index += 1;
        }
    }
    return 0;
}

/// 求树的深度
func treeDepth(rootNode : TreeNode?) -> Int {
    if rootNode == nil {
        return 0
    }
    let leftDepth = treeDepth(rootNode: rootNode?.leftChild);
    let rightDepth = treeDepth(rootNode: rootNode?.rightChild)
    return max(leftDepth, rightDepth) + 1
}

/// 获取树的叶子树，递归法
func treeLeafNodeNumber2(rootNode : TreeNode?) -> Int {
    if rootNode == nil {
        return 0;
    }
    if rootNode?.leftChild == nil && rootNode?.rightChild == nil {
        return 1;
    }
    return treeLeafNodeNumber2(rootNode: rootNode?.leftChild) + treeLeafNodeNumber2(rootNode: rootNode?.rightChild)
}

/// 获取树的叶子树，非递归法
func treeLeafNodeNumber1(rootNode : TreeNode?) -> Int {
    var result = 0;
    if rootNode == nil {
        return result;
    }
    // 1. 直接遍历一遍，如果没有左、右子结点，则数量加1
    let queue = Queue<TreeNode>()
    queue.enque(data: rootNode!)
    while !queue.isEmpty() {
        let node = queue.deque();
        print("\(node.value) -> ", terminator: "")
        if node.leftChild != nil{
            queue.enque(data: node.leftChild!)
        }
        if node.rightChild != nil{
            queue.enque(data: node.rightChild!)
        }
        if node.leftChild == nil && node.rightChild == nil {
            result += 1
        }
    }
    return result;
}

/// 获取树的节点数
func treeNodeNumber(rootNode : TreeNode?) -> Int {
    if rootNode == nil {
        return 0
    }
    // 左边的子结点数量
    let leftNumber = treeNodeNumber(rootNode: rootNode?.leftChild);
    let rightNumber = treeNodeNumber(rootNode: rootNode?.rightChild);
    return leftNumber + rightNumber + 1
}

/// 后序遍历，递归法
func postOrder1(rootNode : TreeNode?) {
    if rootNode == nil {
        return
    }
    postOrder1(rootNode: rootNode?.leftChild);
    postOrder1(rootNode: rootNode?.rightChild);
    print("\(rootNode!.value) -> ", terminator: "")
}

//            0
//        1       2
//     3     4       5
//   6   7 8

/// 层序遍历
func levelOrder(rootNode : TreeNode) {
    let queue = Queue<TreeNode>()
    queue.enque(data: rootNode)
    while !queue.isEmpty() {
        let node = queue.deque();
        print("\(node.value) -> ", terminator: "")
        if node.leftChild != nil{
            queue.enque(data: node.leftChild!)
        }
        if node.rightChild != nil{
            queue.enque(data: node.rightChild!)
        }
    }
}

/// 后序遍历，非递归法
func postOrder2(rootNode : TreeNode?) {
    print("后序遍历，非递归法：")
    let stack1 = Stack<TreeNode>()
    let stack2 = Stack<TreeNode>()
    stack1.push(data: rootNode!)
    while !stack1.isEmpty() {
        let node = stack1.pop();
        stack2.push(data: node);
        if node.leftChild != nil {
            stack1.push(data: node.leftChild!)
        }
        if node.rightChild != nil {
            stack1.push(data: node.rightChild!)
        }
    }
    
    while !stack2.isEmpty() {
        let node = stack2.pop()
        print("\(node.value) -> ", terminator: "")
    }
}

/// 中序遍历，递归法
func inOrder1(rootNode : TreeNode?) {
    if rootNode == nil {
        return
    }
    inOrder1(rootNode: rootNode?.leftChild);
    print("\(rootNode!.value) -> ", terminator: "")
    inOrder1(rootNode: rootNode?.rightChild);
}

/// 中序遍历，非递归法
func inOrder2(rootNode : TreeNode?) {
    print("中序遍历，非递归法：")
    
    // 解法1：
    var node = rootNode;
    let stack = Stack<TreeNode>()
    while !stack.isEmpty() || node != nil{
        if node != nil {
            stack.push(data: node!)
            node = node?.leftChild;
        }else{
            node = stack.pop();
            print("\(node!.value) -> ", terminator: "")
            node = node?.rightChild
        }
    }
    
    // 解法2：
//    var node = rootNode;
//    let stack = Stack<TreeNode>()
//    while node != nil{
//        stack.push(data: node!)
//        node = node?.leftChild
//    }
//
//    while !stack.isEmpty() {
//        let node = stack.pop();
//        print("\(node.value) -> ", terminator: "")
//        if node.rightChild != nil{
//            var curNode = node.rightChild
//            while curNode != nil{
//                stack.push(data: curNode!)
//                curNode = curNode?.leftChild
//            }
//        }
//    }
}

/// 前序遍历，递归法
func preOrder1(rootNode : TreeNode?) {
    if rootNode == nil {
        return
    }
    print("\(rootNode!.value) -> ", terminator: "")
    preOrder1(rootNode: rootNode?.leftChild)
    preOrder1(rootNode: rootNode?.rightChild)
}

/// 前序遍历，非递归算法
func preOrder2(rootNode : TreeNode?) {
    print("前序遍历非递归法：")
    if rootNode == nil {
        return;
    }
    let stack : Stack = Stack<TreeNode>()
    stack.push(data: rootNode!);
    
    while !stack.isEmpty() {
        let node = stack.pop();
        print("\(node.value) -> ", terminator: "")
        if node.rightChild != nil {
            stack.push(data: node.rightChild!)
        }
        if node.leftChild != nil {
            stack.push(data: node.leftChild!)
        }
    }
}

