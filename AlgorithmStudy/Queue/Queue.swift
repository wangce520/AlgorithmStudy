//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/5/21.
//

import Foundation

class Queue<T> : NSObject{
    
    var array : Array = Array<T>()
    
    // 入队
    func enque(data : T) {
        array.append(data);
    }
    
    // 出队
    func deque() -> T {
        return array.removeFirst();
    }
    
    // 判断队列是否为空
    func isEmpty() -> Bool {
        return array.count == 0;
    }
    
    // 获取数量
    func count() -> Int {
        return array.count;
    }
}
