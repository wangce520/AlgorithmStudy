//
//  Sort.swift
//  AlgorithmStudy
//
//  Created by 王策 on 2021/4/19.
//

import Foundation

class Sort: NSObject {
    var arr : Array<Int> = [4,3,2,5,7,6,9,8,1]
//    var arr : Array<Int> = [4,3]

    // 冒泡排序
    func maopao() {
        print("冒泡排序：")
        var flag = false;
        for i in 0..<(arr.count) {
            for j in 0..<arr.count - i - 1 {
                if arr[j] > arr[j+1] {
                    let temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                    flag = true;
                }
            }
            if flag == false {
                break;
            }
        }
        print(arr);
    }
    
    // 插入排序 4 3 5
    func charu() {
        print("插入排序：")
        for i in 1..<arr.count {
            var index = 0;
            let value = arr[i];
            for j in (0...i).reversed() {
                index = j;
                if j > 0 && arr[j - 1] > value {
                    arr[j] = arr[j-1];
                }else{
                    break;
                }
            }
            arr[index] = value;
        }
        print(arr);
    }
    
    // 选择排序
    func selection() {
        print("选择排序：")
        for i in 0..<arr.count-1 {
            // 找到最小的
            var minIndex = i;
            for j in i..<arr.count{
                if arr[j] < arr[minIndex] {
                    minIndex = j;
                }
            }
            
            // 最小的和 i 交换位置
            if(minIndex != i){
                let temp = arr[i];
                arr[i] = arr[minIndex];
                arr[minIndex] = temp;
            }
        }
        print(arr);
    }
    
    // 归并排序
    func guibing() {
        print("归并排序：")
        
    }
    
    func guibing_sort(begin : Int,end : Int){
        if begin >= end {
            return;
        }
        let mid = (begin + end) / 2
        guibing_sort(begin: begin, end: mid)
        guibing_sort(begin: mid + 1, end: end);
//        merge
    }
}

