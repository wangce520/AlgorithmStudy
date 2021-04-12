//
//  ArrayMerge.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/4/10.
//

import Foundation

class ArrayMerge: NSObject,PublicProtocol {

    var arr1 = [2,7,11,15]
    var arr2 = [1,3,4,5,6,90,100,101]
    
    override init() {
        super.init()
        print("两个数组合并为一个有序数组")
        self.run()
    }
    
    func run() {
        mergeArray2(arr1: &arr1, arr2: arr2)
    }
    
    // 逆向双指针
    func mergeArray2( arr1 : inout [Int], arr2 : [Int]) {
        var arr1Index = arr1.count - 1;
        var arr2Index = arr2.count - 1;
        let totalCount = arr1.count + arr2.count
        var lastIndex = totalCount - 1;
        for i in (arr1Index + 1) ..< totalCount{
            // 使用 0 占位
            arr1.append(0);
        }
        
        // 0 1 2 _ _ _
        // 0 1 2
        
        while arr1Index >= 0 || arr2Index >= 0{
            if arr1Index == -1 {
                arr1[lastIndex] = arr2[arr2Index]
                arr2Index -= 1
            }else if arr2Index == -1{
                arr1[lastIndex] = arr1[arr1Index]
                arr1Index -= 1
            }else if arr1[arr1Index] >= arr2[arr2Index]{
                arr1[lastIndex] = arr1[arr1Index]
                arr1Index -= 1
            }else{
                arr1[lastIndex] = arr2[arr2Index]
                arr2Index -= 1
            }
            lastIndex -= 1;
        }
        
        print(arr1)
    }
    
    // 正向双指针
    func mergeArray1(arr1 : [Int], arr2 : [Int]) {
        var result = Array<Int>()
        var arr1Index = 0;
        var arr2Index = 0;
        
        while arr1Index < arr1.count || arr2Index < arr2.count {
            if arr1Index == arr1.count {
                result.append(arr2[arr2Index])
                arr2Index += 1
            } else if arr2Index == arr2.count{
                result.append(arr1[arr1Index])
                arr1Index += 1
            } else if arr1[arr1Index] <= arr2[arr2Index]{
                result.append(arr1[arr1Index])
                arr1Index += 1
            }else{
                result.append(arr2[arr2Index])
                arr2Index += 1
            }
        }
        
        print(result)
    }
}
