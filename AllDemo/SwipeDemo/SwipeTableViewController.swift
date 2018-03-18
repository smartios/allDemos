//
//  ViewController.swift
//  swipeDemo
//
//  Created by SL-167 on 3/10/18.
//  Copyright © 2018 SL-167. All rights reserved.
//

import UIKit

class SwipeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var index:IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        settingNav(navView: self.navigationController!)
        self.title = "Swipe"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func back()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "oneCell")!
        
        let frontView = cell.viewWithTag(2)!
        
        //        if(indexPath.row == 1)
        //        {
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        pan.accessibilityHint = "\(indexPath.row)"
        frontView.addGestureRecognizer(pan)
        
        
        //            let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        //            swipe.direction = .left
        //            swipe.accessibilityHint = "\(indexPath.row)"
        //            frontView.addGestureRecognizer(swipe)
        // }
        
        return cell
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer)
    {
        
        let index = IndexPath(row: Int(gesture.accessibilityHint!)!, section: 0)
        let cell = tableView.cellForRow(at: index)!
        let frontView = cell.viewWithTag(2)!
        
        if(gesture.direction == .right)
        {
            UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveLinear, animations:
                {
                    frontView.frame = CGRect(x: 0, y: 0, width: frontView.frame.size.width, height: frontView.frame.size.height)
            }, completion: nil)
        }
        else if(gesture.direction == .left)
        {
            let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
            swipe.direction = .right
            swipe.accessibilityHint = "\(index.row)"
            frontView.addGestureRecognizer(swipe)
            UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveLinear, animations:
                {
                    frontView.frame = CGRect(x: -(frontView.frame.size.width/2), y: 0, width: frontView.frame.size.width, height: frontView.frame.size.height)
            }, completion: nil)
        }
    }
    
    
    @objc func handlePan(gesture: UIPanGestureRecognizer)
    {
        let translation = gesture.translation(in: self.view)
        
        if(index != nil && index.row != Int(gesture.accessibilityHint!)!)
        {
            resetCells(indexCell: index)
        }
        
        index = IndexPath(row: Int(gesture.accessibilityHint!)!, section: 0)
        
        if gesture.state == .began || gesture.state == .changed {
            // note: 'view' is optional and need to be unwrapped
            
            if(((gesture.view?.frame.origin.x)! + translation.x) > 0 || Int((gesture.view?.frame.origin.x)! + translation.x) <=  Int(-((gesture.view?.frame.size.width)!/2)-5))
            {
                return
            }
            
            gesture.view!.center = CGPoint(x: gesture.view!.center.x + translation.x, y: gesture.view!.center.y)
            gesture.setTranslation(CGPoint.zero, in: self.view)
        }
        else
        {
            if(Int((gesture.view?.frame.origin.x)! + translation.x) <=  Int(-((gesture.view?.frame.size.width)!/3)))
            {
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations:
                    {
                        gesture.view!.frame = CGRect(x: -(gesture.view!.frame.size.width)/2, y: 0, width: gesture.view!.frame.size.width, height: gesture.view!.frame.size.height)
                }, completion: nil)
            }
            else
            {
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations:
                    {
                        gesture.view!.frame = CGRect(x: 0, y: 0, width: gesture.view!.frame.size.width, height: gesture.view!.frame.size.height)
                }, completion: nil)
            }
        }
        
    }
    
    func resetCells(indexCell: IndexPath)
    {
        let cell = self.tableView.cellForRow(at: indexCell)!
        let frontView = cell.viewWithTag(2)!
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations:
            {
                frontView.frame = CGRect(x: 0, y: 0, width: frontView.frame.size.width, height: frontView.frame.size.height)
        }, completion: nil)
    }
    
}

