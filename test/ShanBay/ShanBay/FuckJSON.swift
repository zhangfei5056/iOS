//
//  FuckJSON.swift
//  test_Swfit_post_JSON
//
//  Created by caoyuan on 7/8/14.
//  Copyright (c) 2014 caoyuan_mini. All rights reserved.
//

import UIKit

class FuckJSON: NSObject {

    class func fuckEverythingToJson(everythingYouWantFuck:AnyObject?) ->NSData?{
        var data:NSData = NSJSONSerialization.dataWithJSONObject(everythingYouWantFuck, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
        return data
    }

    class func fuckJsonToDic(jsonData:NSData?)->NSDictionary {
        var responseString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        var strData:NSData = responseString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var dic:NSDictionary = NSJSONSerialization.JSONObjectWithData(strData, options: NSJSONReadingOptions.MutableLeaves, error: nil) as NSDictionary
        return dic
    }

    class func fuckJsonToArray(jsonData:NSData?)->NSArray {
        var responseString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        var strData:NSData = responseString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var ary:NSArray = NSJSONSerialization.JSONObjectWithData(strData, options: NSJSONReadingOptions.MutableLeaves, error: nil) as NSArray
        return ary
    }
}
