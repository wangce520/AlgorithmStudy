//
//  Array.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/4/10.
//

import Foundation

class CE_Array : NSObject,PublicProtocol {
    var _arr = [Int](repeating: 0, count: 100)
    
    override init() {
        super.init()
        _arr = [1,2,3,4,5,6,7,8,9]
        run()
    }
    
    func run() {
        self.insertObject(obj: 666, index: 4)
        self.deleteObject(index: 4)
    }
    
    // 插入一个元素
    func insertObject(obj:Int, index:Int) {
        if index >= _arr.count {
            _arr.append(obj);
        }else{
            _arr.append(0);
            // 都向后移动一位
            for i in (index + 1 ..< _arr.count).reversed() {
                _arr[i] = _arr[i - 1]
            }
            _arr[index] = obj
        }
        print("插入后: \(_arr)")
    }
    
    // 删除一个元素
    func deleteObject(index:Int) {
        if index >= _arr.count {
            _arr.removeLast();
        }else{
            for i in (index ..< _arr.count - 1) {
                _arr[i] = _arr[i + 1]
            }
            _arr.removeLast();
        }
        print("删除后: \(_arr)")
    }
}
