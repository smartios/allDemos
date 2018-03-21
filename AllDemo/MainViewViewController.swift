//
//  MainViewViewController.swift
//  AllDemo
//
//  Created by Vaibhav Agarwal on 3/18/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit
import Alamofire

class MainViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingNav(navView: self.navigationController!)
        self.title = "Select Demo"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let label = cell.viewWithTag(1) as! UILabel
        
        if(indexPath.row == 0)
        {
            label.text = "Xib Demo"
        }
        else if(indexPath.row == 1)
        {
            label.text = "Swipe Demo"
        }
        else if(indexPath.row == 2)
        {
            label.text = "Textfield Demo"
        }
        else if(indexPath.row == 3)
        {
            label.text = "Child View Demo"
        }
        else if(indexPath.row == 4)
        {
            label.text = "Session Demo"
        }
        
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 0)
        {
            let vc = LoginViewController(nibName: "LoginScreen", bundle: nil) as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if(indexPath.row == 1)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SwipeTableViewController") as! SwipeTableViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if(indexPath.row == 2)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if(indexPath.row == 3)
        {
            let story = UIStoryboard(name: "Main2", bundle: nil)
            let vc = story.instantiateViewController(withIdentifier: "AddMainViewController") as! AddMainViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if(indexPath.row == 4)
        {
            let vc = SessionViewController(nibName: "SessionViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    func webservice()
//    {
//        let va = dic as! Parameters
//        Alamofire.request("https://yourServiceURL.com", method: .post, parameters:va, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//
//            switch(response.result) {
//            case .success(_):
//                if response.result.value != nil{
//                    print(response.result.value!)
//                }
//                break
//
//            case .failure(_):
//                print(response.result.error!)
//                break
//
//            }
//        }
//    }
    
}
