//
//  PassValueStyleModel.swift
//  PassValueSwiftProject
//
//  Created by OKAR OU on 11/24/15.
//  Copyright © 2015 OKAR OU. All rights reserved.
//

import UIKit

class PassValueStyleModel: NSObject {
    
    var passValueStyle: String?
    
    class var sharedInstance: PassValueStyleModel {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: PassValueStyleModel? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = PassValueStyleModel()
        }
        return Static.instance!
    }
}
