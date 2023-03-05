//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit
class FirstViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var temp: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAction() {
        guard let url = URL(string: "https://www.naver.com") else { return }
        let urlTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                DispatchQueue.main.async {
                    self.textView.text = String(data: data, encoding: .utf8)
                }
            }
            
        }
        
        urlTask.resume()
    }
}
