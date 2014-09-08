//
//  SettingsViewController.swift
//  tips
//
//  Created by Vidhya Suresh on 9/7/14.
//  Copyright (c) 2014 Vidhya Suresh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercent1Field: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onFieldEditingEnd(sender: AnyObject) {
 
        
       
    }
    
    override func viewWillDisappear(animated: Bool){
        var defaults = NSUserDefaults.standardUserDefaults()
        var segmentnumber = "\(tipSegment.selectedSegmentIndex)"
       // print("In settings segnum \(segmentnumber) input \(tipPercent1Field.text)")
        defaults.setObject(tipPercent1Field.text, forKey: segmentnumber)
        defaults.setObject(segmentnumber, forKey: "segmentindexchanged")
        defaults.synchronize()
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
