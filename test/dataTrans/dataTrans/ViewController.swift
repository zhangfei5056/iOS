//
//  ViewController.swift
//  dataTrans
//
//  Created by caoyuan on 7/12/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tempString:String = ""
    @IBOutlet var textFiedl : UITextField
    @IBOutlet var tfeld : UITextField
    @IBOutlet var textField : UITextField
    @IBAction func push(sender : AnyObject) {
        var sVC = SViewController()
        sVC.tempString = self.textField.text
//[self performSegueWithIdentifier:@"111" sender:self];
        self.performSegueWithIdentifier("good", sender: sender)
//        self.shouldPerformSegueWithIdentifier("good", sender:self);
    }
    @IBOutlet var tf : UITextField
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

