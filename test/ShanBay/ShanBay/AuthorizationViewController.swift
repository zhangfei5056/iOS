//
//  AuthorizationViewController.swift
//  ShanBay
//
//  Created by caoyuan on 7/11/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {
    @IBOutlet var webView : UIWebView
    var token:NSString?

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let urlStr = "https://api.shanbay.com/oauth2/authorize/?client_id=8f1694c9eb0e0fb3009e&response_type=token&redirect_uri=https://api.shanbay.com/oauth2/auth/success/"
        webView.loadRequest(NSURLRequest(URL: NSURL(string: urlStr)))
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
    @IBAction func getTheToken(sender : AnyObject) {
        let nowURLString:NSString? = webView.request.URL.absoluteString
        token = nowURLString!.substringWithRange(NSMakeRange(58, 30))
        if token == nil {
            println("token is nil")
        }
        else {
            var searchVC = SearchViewController(nibName: nil, bundle: nil)
            searchVC.token = token
            self.presentModalViewController(searchVC, animated: true)
        }


    }

}