//
//  SecondViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/02/19.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondLabel: UILabel!
    var secondString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        secondLabel.text = secondString
    }
    
//    @IBAction func append() {
//        secondString? += "z"
//        secondLabel.text = secondString
//        callerVC?.setTextField(secondString!)
//    }

}
