//
//  ViewController.swift
//  XibDemo
//
//  Created by SL-167 on 3/2/18.
//  Copyright © 2018 SL-167. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var tableView: UITableView!
    var dataDict: NSMutableDictionary = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "buttonAndImageCellTableViewCell", bundle: nil), forCellReuseIdentifier: "buttonCell")
        tableView.register(UINib(nibName: "imageAndLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "imageCell")
        tableView.register(UINib(nibName: "basicTextandLabelCell", bundle: nil), forCellReuseIdentifier: "basicTextCell")
        
        self.title = "Xib Demo"
        settingNav(navView: self.navigationController!)
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
         self.tableView.estimatedRowHeight = 100
         self.tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func back()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- tableview functions
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(indexPath.row == 3 || indexPath.row == 0 || indexPath.row == 4)
        {
            return UITableViewAutomaticDimension
        }
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var mainCell = UITableViewCell()
        
        if(indexPath.row == 0)
        {
            let cell: imageAndLabelTableViewCell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! imageAndLabelTableViewCell
            cell.logoImgView.backgroundColor = UIColor.brown
            cell.logoImgView.isHidden = true
            cell.otherImgView.isHidden = false
            cell.headingLabel.text = "Login"
            
            mainCell = cell
        }
        if(indexPath.row == 1)
        {
            let cell: basicTextandLabelTableViewCell = tableView.dequeueReusableCell(withIdentifier: "basicTextCell") as! basicTextandLabelTableViewCell
            cell.textfield.delegate = self
            cell.textfield.text = ""
            cell.hidePassBtn()
            cell.hideMobileBtnView()
            cell.textfield.isSecureTextEntry = false
            cell.headerLabel.text = "Email/Mobile Number"
            
            if(dataDict.value(forKey: "email") != nil)
            {
                cell.textfield.text = "\(dataDict.value(forKey: "email")!)"
                
                if ConstantFunctions.checkForMobileNumOrEmail(text: "\(dataDict.value(forKey: "email")!)")
                {
                    cell.showMobileBtnView()
                    cell.mobNumBtn.setTitle("+91", for: .normal)
                }
            }
            
            mainCell = cell
        }
        else if(indexPath.row == 2)
        {
            let cell: basicTextandLabelTableViewCell = tableView.dequeueReusableCell(withIdentifier: "basicTextCell") as! basicTextandLabelTableViewCell
            cell.textfield.delegate = self
            cell.textfield.text = ""
            cell.showPassBtn()
            cell.hideMobileBtnView()
            cell.textfield.isSecureTextEntry = true
            cell.headerLabel.text = "Password"
            
            if(dataDict.value(forKey: "password") != nil)
            {
                cell.textfield.text = "\(dataDict.value(forKey: "password")!)"
            }
            
            mainCell = cell
        }
        else if(indexPath.row == 3 || indexPath.row == 4)
        {
            let cell: buttonAndImageCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell") as! buttonAndImageCellTableViewCell
            
            if(indexPath.row == 3)
            {
                cell.mainButton.setTitle("Login", for: .normal)
                cell.upperButton.setTitle("Forgot Password?", for: .normal)
                cell.upperButton.addTarget(self, action: #selector(forgotPass(_:)), for: .touchUpInside)
                cell.showMainBtn()
                cell.showUpperBtn()
            }
            else
            {
                cell.mainButton.setTitle("", for: .normal)
                cell.upperButton.setTitle("Register", for: .normal)
                cell.hideMainBtn()
                cell.showUpperBtn()
            }
            
            mainCell = cell
        }
        return mainCell
    }
    
    //MARK:- textfield functions
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let index: IndexPath = ConstantFunctions.getIndexPath(tableView: tableView, sender: textField)
        
        
        if(index.row == 1)
        {
            textField.returnKeyType = .next
            textField.keyboardType = .emailAddress
        }
        else
        {
            textField.returnKeyType = .done
            textField.keyboardType = .asciiCapable
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let index: IndexPath = ConstantFunctions.getIndexPath(tableView: tableView, sender: textField)
        self.view.endEditing(true)
        
        if(index.row == 1)
        {
            dataDict.setValue(textField.text, forKey: "email")
        }
        else
        {
            dataDict.setValue(textField.text, forKey: "password")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let index: IndexPath = ConstantFunctions.getIndexPath(tableView: tableView, sender: textField)
        let cell: basicTextandLabelTableViewCell = tableView.cellForRow(at: index) as! basicTextandLabelTableViewCell
        
        if(index.row == 1)
        {
            if(((textField.text! as NSString).replacingCharacters(in: range, with: string)).trimmingCharacters(in: .whitespacesAndNewlines) != "" && ConstantFunctions.checkForMobileNumOrEmail(text: (textField.text! as NSString).replacingCharacters(in: range, with: string)) == true)
            {
                cell.showMobileBtnView()
                cell.mobNumBtn.setTitle("+91", for: .normal)
            }
            else
            {
                cell.hideMobileBtnView()
            }
        }
        
        return true
    }
    
    //MARK:- button
    
    @IBAction func forgotPass(_ sender: UIButton)
    {
      
    }
    
}

