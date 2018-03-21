//
//  SessionViewController.swift
//  AllDemo
//
//  Created by Vaibhav Agarwal on 3/19/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit
import CoreLocation

class SessionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailFld: UITextField!
    @IBOutlet weak var passwordFld: UITextField!
    var dataDic =  NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Session Demo"
        settingNav(navView: self.navigationController!)
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton

        emailFld.delegate = self
        passwordFld.delegate = self
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if(textField == emailFld)
        {
            dataDic.setValue(textField.text, forKey: "user_name")
        }
        else
        {
            dataDic.setValue(textField.text, forKey: "password")
        }
    }
    
    
    func webservice()
    {
        //        var dic = Parameters()
        //        dic["user_name"] = "vaibhav@singsys.com"
        //        dic["password"] = "12345678"
        //        dic["device_type"] = "ios"
        //        dic["device_id"] = ""
        //        dic["device_token"] = ""
        
        let params: [String : Any] = [
            "email": "akashkumar+h@singsys.com",
            "password": "Lucknow1",
            "device_type":"ios",
            "device_id":"12314343",
            "device_token":"b34314b3jk14bjk34b"
        ]
        
        let url = URL(string: "http://mds.westixx.customer.hostsg.com/staging/public/index.php/api/auth/login")
        
        Alamofire.request(url!, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
            
            print(response)
        }
    }
    
    
    @IBAction func submit(_ sender: UIButton)
    {
        self.view.endEditing(true)
        dataDic.setValue("ios", forKey: "device_type")
        dataDic.setValue("", forKey: "device_token")
        dataDic.setValue(UIDevice.current.identifierForVendor!.uuidString, forKey: "device_id")
        
        let params: [String : Any] = [
            "email": "vaibhav+patient@singsys.com",
             "password": "12345678",
             "user_type":"patient"
        ]
       
        let url = URL(string: "https://quickhealth4u.com/webservice/login")
        var request = URLRequest(url: url!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("text/html", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody =  params.dataFromHttpParameters()
        request.timeoutInterval = 120
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
         
            guard data != nil && error == nil else {
                print("error submitting request: \(error!)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("response was not 200: \(response!)")
                return
            }
            
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        
                        let dic = try JSONSerialization.jsonObject(with: data!)
                        print(dic)
                        
                        let newStr = String(data: data!, encoding: .utf8)
                        print(newStr)
                    }
                }
            } catch let parseError as NSError {
                print("JSON Error \(parseError.localizedDescription)")
            }
            
            
           
        }
        task.resume()
//        let task = URLSession.shared.dataTask(with: request){ data, response, error in
//
//            guard data != nil && error == nil else {
//                print("error submitting request: \(error!)")
//                return
//            }
//
//            let dic = try JSONSerialization.jsonObject(with: data)
//
//            print(dic)
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
//                print("response was not 200: \(response!)")
//                return
//            }
//
//            let newStr = String(data: data!, encoding: .utf8)
//            print(newStr)
//        }
        
    }
}

extension Dictionary {
    
    /// This creates a String representation of the supplied value.
    ///
    /// This converts NSDate objects to a RFC3339 formatted string, booleans to "true" or "false",
    /// and otherwise returns the default string representation.
    ///
    /// - parameter value: The value to be converted to a string
    ///
    /// - returns:         String representation
    
    private func httpStringRepresentation(_ value: Any) -> String {
        switch value {
        case let date as Date:
            return date.rfc3339String()
            
        case let coordinate as CLLocationCoordinate2D:
            return "\(coordinate.latitude),\(coordinate.longitude)"
        case let boolean as Bool:
            return boolean ? "true" : "false"
        default:
            return "\(value)"
        }
    }
    
    /// Build `Data` representation of HTTP parameter dictionary of keys and objects
    ///
    /// This percent escapes in compliance with RFC 3986
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// :returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
    
    func dataFromHttpParameters() -> Data {
        let parameterArray = self.map { (key, value) -> String in
          
            let percentEscapedKey = (key as! String).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            let percentEscapedValue = httpStringRepresentation(value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return "\(percentEscapedKey!)=\(percentEscapedValue!)"
        }
        
        return parameterArray.joined(separator: "&").data(using: .utf8)!
    }
}

extension Date {
    
    /// Get RFC 3339/ISO 8601 string representation of the date.
    ///
    /// For more information, see:
    ///
    /// https://developer.apple.com/library/ios/qa/qa1480/_index.html
    ///
    /// - returns: Return RFC 3339 representation of date string
    
    func rfc3339String() -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return formatter.string(from: self)
    }
}
