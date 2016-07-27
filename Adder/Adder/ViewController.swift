//
//  ViewController.swift
//  Adder
//
//  Created by 刘文炎 on 7/27/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBAction func addition() {
        var addend1 = Int(self.text1.text!)
        var addend2 = Int(self.text2.text!)
        if ((self.text1.text?.isEmpty) == nil) {
            addend1 = 0
        }
        if (!self.text2.hasText()) {
            addend2 = 0
        }
        
        
        var sum = addend1! + addend2!
        
        var sumString = "\(sum)"
        self.sumLabel.text = sumString
        
        self.text1.endEditing(true)
        self.text2.endEditing(true)
    }
    
    @IBAction func allClean(sender: AnyObject) {
        self.sumLabel.text = "0"
        self.text1.text = ""
        self.text2.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

