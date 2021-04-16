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
    var array : Array<T> = Array()
    
    // 进栈操作
    func push(data : T) {
        array.append(data)
        self.logStack();
    }
    
    // 出栈操作
    func pop() {
        if isEmpty() {
            print("栈为空")
            return;
        }
        array.removeLast()
        self.logStack();
    }
    
    // 判断栈是否为空
    func isEmpty() -> Bool {
        return array.count == 0
    }
    
    // 输出栈
    func logStack() {
        print(array);
    }
}

//

func cacluteResult() -> Int {
    let charArr : Array<Character> = ["+","-","*","/"]
    let string : String = "34+13*9+44-12/3"
    let stackChar = Stack<Character>()
    let stackInt = Stack<Int>()

    for char in string {
        // 计算
        if charArr.contains(char) {
            
        }else{
//            stackInt.push(data: char.toInt)
        }
    }
    
    
    return 0
}
