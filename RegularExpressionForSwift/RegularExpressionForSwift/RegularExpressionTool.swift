//
//  RegularExpressionTool.swift
//  RegularExpressionForSwift
//
//  Created by Mac on 16/5/16.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

import UIKit

class RegularExpressionTool: NSObject {
    class var shareInstance: RegularExpressionTool{
        struct Static {
            static let instance  = RegularExpressionTool()
        }
        return Static.instance
    }
    
    func validateAccount(account: String) -> Bool {
        let ac = "^[a-zA-Z0-9]{4,20}+$"
        let regexAccount = NSPredicate(format: "SELF MATCHES %@",ac)
        if regexAccount.evaluateWithObject(account) {
            return true;
        }
        return false;
    }
    
    
    func validatePassword(password:String) -> Bool {
        let ac = "^[a-zA-Z0-9]{6,10}+$"
        let regexPassword = NSPredicate(format: "SELF MATCHES %@", ac)
        if regexPassword.evaluateWithObject(password) {
            return true
        }
        return false
    }
    
    func validatePhone(phone:String) -> Bool {
        let ac = "^[1][3458][0-9]{9}$"
        let regexPhone = NSPredicate(format: "SELF MATCHES %@", ac)
        if regexPhone.evaluateWithObject(phone) {
            return true
        }
        return false
    }
    
    func validateEmail(email: String) -> Bool {
        let ac = "^[1][3458][0-9]{9}$"
        let regexEmail = NSPredicate(format: "SELF MATCHES %@", ac)
        if regexEmail.evaluateWithObject(email) {
            return true
        }
        return false
    }
    
    func validateChineseName(name:String) -> Bool {
        let ac = "^[\\u4e00-\\u9fa5]{2,4}$"
        let regexCName = NSPredicate(format: "SELF MATCHES %@", ac)
        if regexCName.evaluateWithObject(name) {
            return true
        }
        return false
    }
    
    func validateNumber(number:String) -> Bool {
        let ac = "^[0-9]*$"
        let regexNum = NSPredicate(format: "SELF MATCHES %@", ac)
        if regexNum.evaluateWithObject(number) {
            return true
        }
        return false
    }
    
    func validateDate(date:String) -> Bool {
        let ac = "^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$"
        let regexDate = NSPredicate(format: "SELF MATCHES %@", ac)
        if regexDate.evaluateWithObject(date) {
            return true
        }
        return false
    }
    
    func validatePrice(price:String) -> Bool {
        let ac = "^[0-9]+(.[0-9]{2})?$"
        let regexPrice = NSPredicate(format: "SELF MATCHES %@", ac)
        if regexPrice.evaluateWithObject(price) {
            return true
        }
        return false
    }
}
