//
//  LyUserInfo.swift
//  LyDataModelDemo
//
//  Created by LiuYu on 15/7/16.
//  Copyright (c) 2015年 LiuYu. All rights reserved.
//

import Foundation

/// 用户信息
class LyUserInfo: LyBaseDataModel, LyDataModelProtocol {
   
    var userName: String = ""   // 姓名
    var isMale: Bool = false    // 性别（是否是男孩）
    var age: Int = 0            // 年龄
    var sign: String?           // 签名
    
    // MARK: LyDataModelProtocol
    required init!(_ dictionary: NSDictionary) {
        if !LyBaseDataModel.existValue(dictionary, "userName", "sex", "age") {
            super.init(dictionary)
            return nil
        }
        
        self.userName = dictionary["userName"]!.description
        self.isMale = (dictionary["sex"]!.description == "1")
        if let age =  (dictionary["age"]!.description).toInt() { self.age = age }
        self.sign = dictionary["sign"] as? String
        
        super.init(dictionary)
    }
    
    func dictionary() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.userName, forKey: "userName")
        dictionary.setValue((self.isMale ? "1" : "0"), forKey: "sex")
        dictionary.setValue(self.age, forKey: "age")
        dictionary.setValue(self.sign, forKey: "sign")
        return dictionary
    }
    
    
}