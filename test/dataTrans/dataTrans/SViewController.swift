//
//  SViewController.swift
//  dataTrans
//
//  Created by caoyuan on 7/12/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

import UIKit

class SViewController: UIViewController {
    var tempString:String = ""

    @IBOutlet var sTextField : UITextField
    @IBAction func back(sender : AnyObject) {

        self.dismissModalViewControllerAnimated(true)
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        println(tempString)
        self.sTextField.text = self.tempString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
