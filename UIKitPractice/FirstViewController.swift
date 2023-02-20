//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit


class FirstViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    func setTextField(_ s: String) {
//        firstTextField.text = s
//    }
//    
//
//    
//    // MARK: 1. segue(storyboard) + prepare
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = (segue.destination as? SecondViewController) {
//            vc.secondString = firstTextField.text
//        }
//    }
    
    // MARK: 2. vc + property
//    @IBAction func nextButtonAction() {
//        guard let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
//        vc.secondString = firstTextField.text
//        present(vc, animated: true)
//    }
    
    // MARK: 3. B -> A pass vc
//    @IBAction func nextButtonAction() {
//        guard let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
//        vc.secondString = firstTextField.text
//        vc.callerVC = self
//        present(vc, animated: true)
//    }
    
}

