//
//  SecondViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/02/19.
//

import UIKit


class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var str: String!

    override func viewDidLoad() {
        super.viewDidLoad()

//        label.text = str
    }
    
    
    
//    MARK: 4. delegate Protocol
//    var delegate: MyDelegate?
//    @IBAction func append() {
//        delegate?.hello()
//    }
//
//
//    MARK: 3. execute A func
//    var callerVC: FirstViewController!
//    @IBAction func append() {
//        str? += "z"
//        label.text = str
//        callerVC?.setTextField(str!)
//    }
//
//        MARK: 5. closure
//        var closure: (() -> String?)?
//        @IBAction func append() {
//            label.text = closure!()
//        }
//
//        MARK: 6. NotificationCenter
        @IBAction func append() {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "14hz"), object: "~packet~")
        }

}
