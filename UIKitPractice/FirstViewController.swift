//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit

class FirstViewController: UIViewController {
    
    var ballBottomConstraint: NSLayoutConstraint?
    var amount = -50
    
    var ball: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.layer.cornerRadius = 20
        return view
    }()
    
    var myButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("move", for: .normal)
        btn.backgroundColor = .purple
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(bounce), for: .touchUpInside)
        
        myButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        myButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        myButton.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 40).isActive = true
        
        self.view.addSubview(ball)
        ball.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        ball.widthAnchor.constraint(equalToConstant: 40).isActive = true
        ball.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        ballBottomConstraint = ball.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ballBottomConstraint?.isActive = true
    }
    
    @objc func bounce() {
        if -(ballBottomConstraint?.constant)! > self.view.safeAreaLayoutGuide.layoutFrame.height || (ballBottomConstraint?.constant)! > 0 {
            amount *= -1
        }
        
        ballBottomConstraint?.constant += CGFloat(amount)
        
        UIViewPropertyAnimator(duration: 0.2, curve: .linear, animations: {
            self.view.layoutIfNeeded()
        }).startAnimation()
        
    }
    
}





#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        FirstViewController()
    }
    
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

#endif
