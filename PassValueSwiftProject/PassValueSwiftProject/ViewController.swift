//
//  ViewController.swift
//  PassValueSwiftProject
//
//  Created by OKAR OU on 11/10/15.
//  Copyright © 2015 OKAR OU. All rights reserved.
//

import UIKit
import SnapKit

protocol ChangeTitleDelegate: NSObjectProtocol {
    func changeTitle(title:String)
}

typealias sendValueClosure = (string: String) -> Void

class ViewController: UIViewController {
    
    /*! this is a super button*/
    var button:UIButton!
    
    var passDataStyle:String?
    
    var delegate:ChangeTitleDelegate?
    var passValueClosure: sendValueClosure?
    
    func initWithClosure(closure:sendValueClosure?) {
        passValueClosure = closure
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        button = UIButton.init(type: UIButtonType.System)
        button.setTitle(passDataStyle!, forState: UIControlState.Normal)
        button.backgroundColor = UIColor.yellowColor()
        button.addTarget(self, action: Selector("buttonClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        button.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - button event
    func buttonClicked() {
        switch (passDataStyle!){
        case "delegate":
            delegate?.changeTitle(passDataStyle!)
        case "notification":
            let passDataDict: NSDictionary = NSDictionary(object: passDataStyle!, forKey: "passDataStyle")
            NSNotificationCenter.defaultCenter().postNotificationName("PASS_DATA_STYLE_NOTIFICATION", object: nil, userInfo:passDataDict as [NSObject : AnyObject])
        case "closure":
            if ((passValueClosure) != nil) {
                passValueClosure!(string: passDataStyle!)
            }
        case "singleton":
            PassValueStyleModel.sharedInstance.passValueStyle = passDataStyle!
        case "userdefault":
            NSUserDefaults.standardUserDefaults().setObject(passDataStyle!, forKey: "PASS_VALUE_STYLE_USER_DEFAULT")
        default:
            print("default")
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

