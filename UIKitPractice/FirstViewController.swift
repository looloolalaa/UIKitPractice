//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit

class FirstViewController: UIViewController {
    
    var uiView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .systemPurple
        uiView.layer.cornerRadius = 20
        return uiView
    }()
    
    var circleView: CircleView = {
        let circleView = CircleView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = .systemPink
        return circleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(uiView)
        NSLayoutConstraint.activate([
            uiView.widthAnchor.constraint(equalToConstant: 100),
            uiView.heightAnchor.constraint(equalToConstant: 100),
            uiView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            uiView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        ])
        
        self.view.addSubview(circleView)
        circleView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        circleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
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
