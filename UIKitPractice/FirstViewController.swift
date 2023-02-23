//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit


class FirstViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//     MARK: 1. segue(storyboard) + prepare
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = (segue.destination as? SecondViewController) {
//            vc.str = textField.text
//        }
//    }

//     MARK: 2. property
//    @IBAction func nextButtonAction() {
//        guard let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
//
////      (error code) vc.secondLabel.text = textField.text
//        vc.str = textField.text
//        present(vc, animated: true)
//    }
//
//     MARK: 3. (B -> A) pass vc
//    @IBAction func nextButtonAction() {
//        guard let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
//        vc.callerVC = self
//        present(vc, animated: true)
//    }
//    func setTextField(_ s: String) {
//        textField.text = s + "1"
//    }
//
//        MARK: 4. delegate Protocol
//
//
//        @IBAction func nextButtonAction() {
//            guard let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
//
//            vc.delegate = self
//            present(vc, animated: true)
//        }
//
//        MARK: 5.closure
        func hello() -> String? {
            textField.text? += "1"
            return textField.text
        }

        @IBAction func nextButtonAction() {
            guard let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
            vc.closure = hello
            present(vc, animated: true)
        }
//
//
//
//        MARK: 6. NotificationCenter
//        NotificationCenter.default.addObserver(self, selector: #selector(trigger), name: NSNotification.Name(rawValue: "14hz"), object: nil)
//        @objc func trigger(_ notification: NSNotification) {
//            if let s = notification.object as? String {
//                textField.text = s
//            }
//        }
}

