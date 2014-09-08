//
//  ViewController.swift
//  tips
//
//  Created by Vidhya Suresh on 9/3/14.
//  Copyright (c) 2014 Vidhya Suresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       // print("In load")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        
        //defaults.setObject("14", forKey: "0")
        defaults.setObject("-1", forKey: "segmentindexchanged")
        defaults.synchronize()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercentages=[tipControl.titleForSegmentAtIndex(0),tipControl.titleForSegmentAtIndex(1),tipControl.titleForSegmentAtIndex(2)]
       // print("tipPercentage[1] \tipPercentage[1]")
        var tipPercentage = NSString(string: tipPercentages[tipControl.selectedSegmentIndex]!).doubleValue
        
        //print(tipPercentage)
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount*tipPercentage/100
        var total = billAmount+tip
        tipLabel.text = "\(tip)"
        totalLabel.text="\(total)"
        
        tipLabel.text=NSString(format:"$%.2f",tip)
        
        totalLabel.text=NSString(format:"$%.2f",total)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var segmentindex = defaults.objectForKey("segmentindexchanged") as String
       // print(segmentindex)
        if (segmentindex != "-1"){
        
        var stringValue = defaults.objectForKey(segmentindex) as String
       // print("In cal \(stringValue)")
        tipControl.setTitle("\(stringValue)%", forSegmentAtIndex: NSString(string: segmentindex).integerValue)
        }
        //print("viewwillappear")
 
        
        onEditingChanged(self)
        

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}
