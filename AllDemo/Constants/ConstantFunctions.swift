//
//  ConstantFunctions.swift
//  XibDemo
//
//  Created by SL-167 on 3/2/18.
//  Copyright © 2018 SL-167. All rights reserved.
//

import UIKit

class ConstantFunctions: NSObject {

    
   class func getIndexPath(tableView: UITableView, sender: Any) -> IndexPath
    {
        let hit = (sender as AnyObject).convert(CGPoint.zero, to: tableView)
        let indexPath = tableView.indexPathForRow(at: hit)
        
        return indexPath!
    }
    
    class func checkForMobileNumOrEmail(text: String) -> Bool
    {
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(text).isSubset(of: nums)
    }
    
}
