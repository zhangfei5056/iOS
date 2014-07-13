//
//  FuckHttp.swift
//  test_Swfit_post_JSON
//
//  Created by caoyuan on 7/8/14.
//  Copyright (c) 2014 caoyuan_mini. All rights reserved.
//

import UIKit
//import "FuckHttp"

class FuckHttp: NSObject {

    class func post(url:NSString?, postData:NSDictionary)->NSArray? {
        var URL = NSURL.URLWithString(url)
        var request = NSMutableURLRequest(URL: URL, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 10)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        var jsonDataFromDic = FuckJSON.fuckEverythingToJson(postData)
        request.HTTPBody = jsonDataFromDic
        var receivedNSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        var dic = FuckJSON.fuckJsonToDic(receivedNSData)
        var detail = dic.objectForKey("detail") as NSDictionary
        var dataList = detail.objectForKey("dataList") as NSArray
        return dataList
    }

    class func get(url:NSString?)->NSDictionary? {
        var URL = NSURL.URLWithString(url)
        var receivedNSData = NSData.dataWithContentsOfURL(URL, options:NSDataReadingOptions.DataReadingUncached, error: nil)
        var dic = FuckJSON.fuckJsonToDic(receivedNSData)
        return dic

    }

}
