//
//  TwoSum.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/4/10.
//

import Foundation

// 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 的那 两个 整数，并返回它们的数组下标。
class TwoSum: NSObject,PublicProtocol {
    
    let arr = [2,7,11,15]
    let target = 26
    
    override init() {
        super.init()
        self.run()
    }
    
    // 执行
    func run() {
        let result = self.twoSum(arr: arr, target: target)
        print(result)
    }
    
    // 方法
    func twoSum(arr : [Int], target : Int) -> [Int] {
        //
        var dict = Dictionary<Int, Int>()
        for i in 0 ..< arr.count{
            let arrIndexValue = arr[i]
            if dict.keys.contains(target - arrIndexValue) {
                let value : Int = dict[target - arrIndexValue]!
                return [value, i]
            }else{
                dict[arrIndexValue] = i
            }
        }
        return [0,0]
    }
}
