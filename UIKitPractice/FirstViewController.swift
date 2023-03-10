//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    var phoneNumber: String = "" {
        didSet {
            self.phoneNumberLabel.textColor = .black
            self.phoneNumberLabel.text = phoneNumber
        }
    }
    
    
    @IBOutlet var numberPads: [CircleButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for btn in numberPads {
            btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        }
    }
    
    @objc func onClick(_ sender: UIButton) {
        guard let str = sender.titleLabel?.text else { return }
        phoneNumber += str
    }
    
    @IBAction func call() {
        phoneNumber = ""
    }
    
}
