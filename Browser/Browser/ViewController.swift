//
//  ViewController.swift
//  Browser
//
//  Created by 刘文炎 on 6/28/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var gotoButton: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func gotoAction(sender: AnyObject) {
        webView.loadRequest(NSURLRequest(URL: NSURL(string: addressField.text!)!))
        addressField.resignFirstResponder()
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

