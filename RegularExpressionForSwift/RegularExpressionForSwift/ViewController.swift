//
//  ViewController.swift
//  RegularExpressionForSwift
//
//  Created by Mac on 16/5/16.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var regularEx : RegularExpressionTool!
    var tview : Toast_UIView!
    var tbView : UITableView!
    var validateArray : [String] = ["账号","密码","手机号","邮箱","中文2~4","验证数字","日期","金额"]
    var dic:NSMutableDictionary = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a     nib.
        
        regularEx = RegularExpressionTool();
        tview = Toast_UIView();
        tview.backgroundColor = UIColor.whiteColor()
        self.view = tview;
        
        let label: UILabel = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH, 60))
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.blackColor()
        label.text = "正则验证"
        self.view.addSubview(label)
        
        tbView = UITableView(frame: CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT-60))
        tbView.backgroundColor = UIColor.whiteColor()
        tbView.dataSource = self
        tbView.delegate = self
        
        self.view.addSubview(tbView)
        
//        let b = regularEx.validateAccount("aaaa");
//        if b == true {
//            print("account is available");
//            tview.makeToast("account is available", value: "", color: UIColor.greenColor())
//        }else{
//            print("account is not available");
//            tview.makeToast("account is not available", value: "", color: UIColor.redColor())
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdent: String = "cellident"
        var tableCell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdent)
        
        if tableCell == nil {
            tableCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdent)
        }
        
        let frame = CGRectMake(5, 0, tableView.frame.size.width-60, 40)
        let utf = UITextField(frame: frame)
        utf.tag = indexPath.row
        utf.placeholder = validateArray[indexPath.row]
        dic.setObject(utf, forKey: NSString(format:"%d",indexPath.row ))
        tableCell?.addSubview(utf)
        
        let button = UIButton(frame:CGRectMake(tableView.frame.size.width-50, 0, 40, 40))
        button.tag = indexPath.row
        button.backgroundColor = UIColor.redColor()
        button.setTitle("验证", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.addTarget(self, action:#selector(ViewController.validate(_:)) , forControlEvents: UIControlEvents.TouchUpInside)
        tableCell?.addSubview(button)
        
        let line:UIView = UIView(frame: CGRectMake(0, 39.5, SCREEN_WIDTH, 0.5))
        line.backgroundColor = UIColor.grayColor()
        tableCell?.addSubview(line)
        tableCell?.selectionStyle = UITableViewCellSelectionStyle.None
        return tableCell!
    }
    
    func validate(uibutton:UIButton) -> Void {
        switch uibutton.tag {
        case 0:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validateAccount(textField.text!)
            if b == true {
                 tview.makeToast("account is available", value: "", color: UIColor.greenColor())
            }else{
                 tview.makeToast("account is not available", value: "", color: UIColor.redColor())
            }
            break;
        case 1:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validatePassword(textField.text!)
            if b == true {
                tview.makeToast("password is available", value: "", color: UIColor.greenColor())
            }else{
                tview.makeToast("password is not available", value: "", color: UIColor.redColor())
            }
            break;
        case 2:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validatePassword(textField.text!)
            if b == true {
                tview.makeToast("password is available", value: "", color: UIColor.greenColor())
            }else{
                tview.makeToast("password is not available", value: "", color: UIColor.redColor())
            }
            break;
        case 3:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validatePhone(textField.text!)
            if b == true {
                tview.makeToast("phone is available", value: "", color: UIColor.greenColor())
            }else{
                tview.makeToast("phone is not available", value: "", color: UIColor.redColor())
            }
            break;
        case 4:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validateEmail(textField.text!)
            if b == true {
                tview.makeToast("email is available", value: "", color: UIColor.greenColor())
            }else{
                tview.makeToast("email is not available", value: "", color: UIColor.redColor())
            }
            break;
        case 5:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validateChineseName(textField.text!)
            if b == true {
                tview.makeToast("chineseName is available", value: "", color: UIColor.greenColor())
            }else{
                tview.makeToast("chineseName is not available", value: "", color: UIColor.redColor())
            }
            break;
        case 6:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validateNumber(textField.text!)
            if b == true {
                tview.makeToast("number is available", value: "", color: UIColor.greenColor())
            }else{
                tview.makeToast("number is not available", value: "", color: UIColor.redColor())
            }
            break;
        case 7:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validateDate(textField.text!)
            if b == true {
                tview.makeToast("date is available", value: "", color: UIColor.greenColor())
            }else{
                tview.makeToast("date is not available", value: "", color: UIColor.redColor())
            }
            break;
        case 8:
            let textField = dic[NSString(format:"%d",uibutton.tag)] as! UITextField
            let b = regularEx.validatePrice(textField.text!)
            if b == true {
                tview.makeToast("price is available", value: "", color: UIColor.greenColor())
            }else{
                tview.makeToast("price is not available", value: "", color: UIColor.redColor())
            }
            break;
            
        default:
            break;
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return validateArray.count;
    }

}

