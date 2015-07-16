//
//  ViewController.swift
//  LyDataModelDemo
//
//  Created by LiuYu on 15/7/16.
//  Copyright (c) 2015年 LiuYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 测试缺失必要数据的创建
        do {
            let dictionary = NSMutableDictionary()
            dictionary.setValue("1", forKey: "sex")
            dictionary.setValue(24, forKey: "age")
            dictionary.setValue("我是一个兵", forKey: "sign")
            println("数据源: \n \(dictionary)\n")
            
            let userInfo = LyUserInfo(dictionary)
            println("数据模型: \n \(userInfo)\n")
            if userInfo == nil {
                println("数据源缺失必要数据，无法创建一个合法的LyUserInfo对象")
            }
            println()
        } while (false)
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue("LiuYu", forKey: "userName")
        dictionary.setValue("1", forKey: "sex")
        dictionary.setValue(24, forKey: "age")
        dictionary.setValue("我是一个兵", forKey: "sign")
        println("数据源: \n \(dictionary)\n")
        
        let userInfo = LyUserInfo(dictionary)
        println("数据模型: \n \(userInfo)\n")
        if userInfo == nil {
            println("数据源缺失必要数据，无法创建一个合法的LyUserInfo对象")
            return
        }
        
        let path = NSTemporaryDirectory().stringByAppendingPathComponent("test")
        println("保存路径: \(path)\n")
        
        // copy
        do {
            let userInfoCopy = userInfo.copy() as! LyUserInfo
            println("Copy出来的数据: \n \(userInfoCopy)\n")
        } while (false)
        
        // 保存到本地
        do {
            var data = NSMutableData()
            let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
            archiver.encodeObject(userInfo)
            archiver.finishEncoding()
            data.writeToFile(path, atomically: true)
        } while (false)
        
        // 从本地获取
        do {
            var data = NSMutableData(contentsOfFile: path)
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
            if let userInfoLocation = unarchiver.decodeObject() as? LyUserInfo {
                println("保存到本地后从本地读取的数据: \n \(userInfoLocation)")
            }
        } while (false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

