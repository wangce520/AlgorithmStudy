//
//  Stack.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/4/16.
//

import UIKit

// 数组实现
class Stack<T>: NSObject {
    
    // 数组
    private var array : Array<T> = Array()
    
    // 进栈操作
    func push(data : T) {
        array.append(data)
    }
    
    // 出栈操作
    func pop() -> T{
        return array.removeLast()
    }
    
    // 判断栈是否为空
    func isEmpty() -> Bool {
        return array.count == 0
    }
    
    // 输出栈
    func log() {
        print(array);
    }
}
