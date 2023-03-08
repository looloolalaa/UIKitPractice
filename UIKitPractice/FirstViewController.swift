//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = MyView()
        myView.data = .init(labelStr: "Hello World!", buttonStr: "click")
        
        self.view.addSubview(myView)
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        myView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150).isActive = true
        myView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -200).isActive = true
        myView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
    }
    
}
