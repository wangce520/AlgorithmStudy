//
//  Array.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/4/10.
//

import Foundation

// 合并两个有序数组
func mergeTwoArray(arr1 : Array<Int>, arr2 : Array<Int>) -> Array<Int> {
    var result = Array<Int>()
    var arr1Index = 0;
    var arr2Index = 0;
    while arr1Index < arr1.count || arr2Index < arr2.count {
        // 需要注意顺序，先进行 arr1Index 或者 arr2Index 和数组的长度比较
        if arr1Index >= arr1.count{
            result.append(arr2[arr2Index]);
            arr2Index = arr2Index + 1
        }else if arr2Index >= arr2.count{
            result.append(arr1[arr1Index])
            arr1Index = arr1Index + 1
        }else if arr1[arr1Index] < arr2[arr2Index] {
            result.append(arr1[arr1Index])
            arr1Index = arr1Index + 1
        }else if arr1[arr1Index] > arr2[arr2Index]{
            result.append(arr2[arr2Index])
            arr2Index = arr2Index + 1
        }
    }
    return result;
}
