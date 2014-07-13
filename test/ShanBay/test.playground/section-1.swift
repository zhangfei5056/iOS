// Playground - noun: a place where people can play

import UIKit

var str = "1234 32    "


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


getWordWithNoSpace(str)