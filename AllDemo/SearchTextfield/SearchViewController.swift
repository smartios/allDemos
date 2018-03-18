//
//  ViewController.swift
//  AutoFillDemo
//
//  Created by Vaibhav Agarwal on 3/17/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var countryText: SearchTextField!
    @IBOutlet weak var acronymText: SearchTextField!
    @IBOutlet weak var countryInlineText: SearchTextField!
    @IBOutlet weak var emailInLineText: SearchTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.title = "Search Demo"
        settingNav(navView: self.navigationController!)
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
        popup_countries()
        acronym_countries()
        countryInline()
         emailInline()
    }
    
    @objc func back()
    {
        self.navigationController?.popViewController(animated: true)
    }

    func emailInline()
    {
        emailInLineText.inlineMode = true
        
        emailInLineText.startFilteringAfter = "@"
        emailInLineText.startSuggestingInmediately = true
        
        // Set data source
        emailInLineText.filterStrings(["gmail.com", "yahoo.com", "yahoo.com.ar"])
    }
    
    func countryInline()
    {
        countryInlineText.inlineMode = true
        let countryArray = self.localCountries()
        countryInlineText.filterStrings(countryArray)
    }
    
    func acronym_countries()
    {
        acronymText.inlineMode = true
        let countryArray = self.localCountries()
        countryText.filterStrings(countryArray)
    }
    
    func popup_countries()
    {
        countryText.startVisibleWithoutInteraction = false
        let countryArray = self.localCountries()
        countryText.filterStrings(countryArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func localCountries() -> [String] {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .dataReadingMapped)
                let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [[String:String]]
                
                var countryNames = [String]()
                for country in jsonResult {
                    countryNames.append(country["name"]!)
                }
                
                return countryNames
            } catch {
                print("Error parsing jSON: \(error)")
                return []
            }
        }
        return []
    }

}

