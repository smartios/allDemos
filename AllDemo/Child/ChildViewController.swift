//
//  ChildViewController.swift
//  AddChildDemo
//
//  Created by Vaibhav Agarwal on 3/17/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {

    @IBOutlet weak var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clicking(_ sender: UIButton)
    {
        if(label.text == "Click")
        {
                label.text = "clicked"
        }
        else
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
                //self.view.removeFromSuperview()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
