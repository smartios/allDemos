//
//  ViewController.swift
//  AddChildDemo
//
//  Created by Vaibhav Agarwal on 3/17/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit


class AddMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Xib Demo"
        settingNav(navView: self.navigationController!)
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
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

    @IBAction func addChild(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
        
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        nav.view.frame = CGRect(x: 20, y: 50, width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height-100)
        self.view.addSubview(nav.view)
        
        addChildViewController(nav)
    }
    
     @IBAction func viewAdd(_ sender: UIButton)
     {
        let v = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! UIView
        v.frame =  CGRect(x: 30, y: 30, width: self.view.frame.width-60, height:self.view.frame.height - 70)
        v.backgroundColor = UIColor.brown
        
        //let label = v.viewWithTag(1) as! UILabel
        let btn = v.viewWithTag(2) as! UIButton
        btn.addTarget(self, action: #selector(checkingView), for: .touchUpInside)
        self.view.addSubview(v)
    }
    
    @objc func checkingView(_ sender: UIButton)
    {
        let v = sender.superview
        let lbl = v?.viewWithTag(1) as! UILabel
        lbl.text = "done"
    }
}

