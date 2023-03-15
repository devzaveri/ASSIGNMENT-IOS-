//
//  ShareModel.swift
//  API Assignment
//
//  Created by promact on 14/03/23.
//




import UIKit

class ShareModel : NSObject{
    
    @objc class func SetCompany(_ array: [String: String]) {
        UserDefaults.standard.set(array, forKey:"DATAS")
        UserDefaults.standard.synchronize()
    }
    
    @objc class func getCompany() -> [String: String] {
        var ar = [String: String]()
        if UserDefaults.standard.object(forKey: "DATAS") != nil { ar = UserDefaults.standard.object(forKey: "DATAS") as! [String: String] }
        return ar
    }
}
