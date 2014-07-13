//
//  ViewController.swift
//  fdsfdsfregf
//
//  Created by caoyuan on 7/13/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter .defaultCenter().addObserver(self, selector: "copyMethod:", name: UIPasteboardChangedNotification, object: nil)

    }

    func copyMethod(sender: AnyObject!) {
        var pd = UIPasteboard.generalPasteboard()
        let dd = pd.string
        println("\(dd)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var tf : UITextField
    @IBAction func ccc(sender : AnyObject) {
        var pd = UIPasteboard.generalPasteboard()
        let dd = pd.string
        println("\(dd)")

    }

}

