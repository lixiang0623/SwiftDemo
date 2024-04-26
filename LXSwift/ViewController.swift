//
//  ViewController.swift
//  LXSwift
//
//  Created by 李祥 on 2024/4/1.
//

import SnapKit

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    let boxview = UIView()
    
    let  ScreenWide = UIScreen.main.bounds.size.width
    let  ScreenHeight = UIScreen.main.bounds.size.height
    
    let accountField = UITextField()
    
    let passwordField = UITextField()
    
    let confimBtn = UIButton()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        self.view.addSubview(accountField)
        self.view.addSubview(passwordField)
        self.view.addSubview(confimBtn)
        
        accountField.placeholder = "请输入你的手机号码"
        passwordField.placeholder = "请输入密码"
        
        accountField.layer.borderColor = UIColor.black.cgColor
        accountField.layer.borderWidth = 1
        
        passwordField.layer.borderColor = UIColor.black.cgColor
        passwordField.layer.borderWidth = 1
        
        passwordField.delegate=self
        accountField.delegate=self
        passwordField.isSecureTextEntry = true
        
        
        
        confimBtn.setTitle("登陆", for:.normal)
        confimBtn.setTitleColor(.red, for: .normal)
        confimBtn.backgroundColor = .gray
        confimBtn.addTarget(self, action: #selector(clickbtn), for: .touchUpInside)
    
        
        accountField.snp.makeConstraints { make in
            make.width.equalTo(ScreenWide-100)
            make.height.equalTo(40)
            make.left.equalTo(50)
            make.top.equalTo(250)
        }
        
        passwordField.snp.makeConstraints { make in
            make.width.equalTo(ScreenWide-100)
            make.height.equalTo(40)
            make.left.equalTo(50)
            make.top.equalTo(accountField.snp.bottom).offset(30)
        }
        
        
        confimBtn.snp.makeConstraints { make in
            make.width.equalTo(ScreenWide-150)
            make.height.equalTo(50)
            make.left.equalTo(75)
            make.top.equalTo(passwordField.snp.bottom).offset(50)
        }
        // Do any additional setup after loading the view.
    }
    @objc func clickbtn()
    {
        
        NSLog("测试点击时间", "dsfsdf")
        
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
    
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        NSLog("dddd", "fsaafsf")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        accountField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        NSLog("dddd", "fsaafsf8888")
        return true
    }
    

}

