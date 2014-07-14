//
//  SearchViewController.swift
//  ShanBay
//
//  Created by caoyuan on 7/11/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITextFieldDelegate {
    var token:NSString?
    var word:NSString?
    var idd:NSString?
    var cn_definition:NSString?
    @IBOutlet var statusBT : UIButton


    @IBOutlet var searchBt : UIButton
    @IBOutlet var serachTextField : UITextField
    @IBOutlet var resultLabel : UILabel

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        println(token)

        // Do any additional setup after loading the view.
        self.serachTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func search(sender : AnyObject) {
        println(token)
        if serachTextField.text.isEmpty {
            self.serachTextField.becomeFirstResponder()
//            self.searchBt.removeFromSuperview();
//            self.searchBt.frame = CGRectMake(26.0, 300.0, 46.0, 30.0)
//            self.view.addSubview(self.searchBt)
        }
        else{
            var mayWithSpaceWord = self.serachTextField.text
            word = getWordWithNoSpace(mayWithSpaceWord)!
            var dic = FuckHttp.get("https://api.shanbay.com/bdc/search/?word=\(word)")
            println(dic)
            cn_definition = dic?.objectForKey("data").objectForKey("cn_definition").objectForKey("defn") as? NSString
            self.resultLabel.text = cn_definition
            let idInt : AnyObject? = dic?.objectForKey("data").objectForKey("conent_id")
            self.idd = "\(idInt)"

        }
    }

//pragma mark - Navigation
// MARK: - UITableViewDataSource
    @IBAction func addNewWord(sender : AnyObject) {
        var addNewWordURL = "https://api.shanbay.com/bdc/learning/?access_token=\(token)"
        var postDic = ["id":self.idd!];
        var dic = FuckHttp.post(addNewWordURL, postData: postDic) as? NSDictionary
        println("\(dic)")
        let msg:NSString? = dic?.objectForKey("msg") as? NSString
        if msg!.isEqualToString("SUCCESS"){
            self.statusBT.titleLabel.text = "已经添加"
        }
        else{
             self.statusBT.titleLabel.text = "添加失败"
        }
    }

    @IBAction func statusBTAction(sender : AnyObject) {
        self.statusBT.titleLabel.text = "status:"
        self.serachTextField.text = ""
    }

    func textFieldShouldReturn(textField: UITextField!) {
        self.serachTextField.resignFirstResponder()
        search("nice")
    }

    // get the space out from the words
    func getWordWithNoSpace(WordStr:String?)->String?{
        var word = WordStr
        if word != nil {
            while word!.hasSuffix(" ") {
                word = word!.substringToIndex(countElements(word!)-1)
            }
        }
        return word!
    }


}
