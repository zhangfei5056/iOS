//
//  ViewController.swift
//  test_Swfit_post_JSON
//
//  Created by caoyuan_mini on 7/7/14.
//  Copyright (c) 2014 caoyuan_mini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var i = 0
    @IBOutlet var ddd : UITextField
    @IBAction func test(sender : AnyObject) {
    }
    @IBAction func push(sender : AnyObject) {
    }
    @IBOutlet var textView : UITextView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        postJson()
    var s = ["sdfdsf":"sdfdsf"]
        var t = object_getClassName(s)
        println(t)
    
        }
    @IBAction func action(sender : AnyObject) {
    }

override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }





//
    @IBAction func pressAction(sender : AnyObject) {
//        postJson()
        var jsonString = "{\"cmd\":\"staticData\", \"params\":{\"dataType\":\"1\"}}"
        var urlString = "http://211.139.123.188:18088/sq_api/api"
        var jsonDic = ["cmd":"staticData", "params":["dataType":"1"]]

        var dataListAry = postJSONStringReturnNSDictionary2(urlString, jsonDic: jsonDic)
        i++
        print(dataListAry[i])
    }
//2
    func postJson()->Void{
        var jsonString = "{\"cmd\":\"staticData\", \"params\":{\"dataType\":\"1\"}}"
        var jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        var req = NSMutableURLRequest(URL: NSURL(string: "http://211.139.123.188:18088/sq_api/api"))
        req.HTTPMethod = "POST"
        req.HTTPBody = NSData(data: jsonData)
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue(), completionHandler: requestSuccess)
    }
 
//3
    func requestSuccess(resp:NSURLResponse!, data:NSData!, error:NSError!) -> Void{
        var str = NSString(data: data, encoding: NSUTF8StringEncoding)
//        println(str)
      self.textView.text = str
        
        
        var dic = putInStringReturnDictionary(str)
        var detail = dic.objectForKey("detail") as NSDictionary
        
        var dataList = detail.objectForKey("dataList") as NSArray
        var one = dataList.objectAtIndex(0) as NSDictionary
//        print(one)
//        println(one)
//        print(one["name"])
    }


    func putInStringReturnDictionary(str:String) -> NSDictionary {
        
        var strData:NSData = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var dic = NSJSONSerialization.JSONObjectWithData(strData, options: NSJSONReadingOptions.MutableLeaves, error: nil) as NSDictionary
        return dic
    }
    
    func postJSONStringReturnNSDictionary(urlString:String, jsonString:String) -> NSArray {
//        1 set a NSURL
        var url = NSURL.URLWithString(urlString)
//        2 set request
        var request = NSMutableURLRequest(URL: url, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 10)
        request.HTTPMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        var jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        request.HTTPBody = NSData(data: jsonData)
        var receivedNSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        var responseString = NSString(data: receivedNSData, encoding: NSUTF8StringEncoding)
        //==================
        var dic = putInStringReturnDictionary(responseString)
        var detail = dic.objectForKey("detail") as NSDictionary
        
        var dataList = detail.objectForKey("dataList") as NSArray
        var one = dataList.objectAtIndex(0) as NSDictionary
        //        print(one)
//        println(one)
        return dataList
    
    }

    func postJSONStringReturnNSDictionary2(urlString:String, jsonDic:NSDictionary) -> NSArray {
        //        1 set a NSURL
        var url = NSURL.URLWithString(urlString)
        //        2 set request
        var request = NSMutableURLRequest(URL: url, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 10)
        request.HTTPMethod = "POST"
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
//        var jsonDataFromDic = NSKeyedArchiver.archivedDataWithRootObject(jsonDic)
        var jsonDataFromDic = NSPropertyListSerialization.dataWithPropertyList(jsonDic, format: .BinaryFormat_v1_0, options: 0, error: nil)
        
        
        
        
        
        
        
        
//        var jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        request.HTTPBody = NSData(data: jsonDataFromDic)
        var receivedNSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        var responseString = NSString(data: receivedNSData, encoding: NSUTF8StringEncoding)
        //==================
        var dic = putInStringReturnDictionary(responseString)
        var detail = dic.objectForKey("detail") as NSDictionary
        
        var dataList = detail.objectForKey("dataList") as NSArray
        var one = dataList.objectAtIndex(0) as NSDictionary
        //        print(one)
        //        println(one)
        return dataList
        
    }




}

