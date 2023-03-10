//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let texts = [
        "asd",
        "123123fansjfnajskfn",
        "my name is ..",
        "sadklamsdlansfjsdnfjsf\nasdasdjnasdjln",
        "sadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtextsadklamsdlansfjsdnfjsfasdasdjnasdjlnverylongtext",
        "0",
        "1",
        "2",
        "4444",
        "4444",
        "7777"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableViewCell")
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 20
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension FirstViewController: UITableViewDelegate {
    
}

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.texts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.contentLabel.text = self.texts[indexPath.row]
        cell.userProfileImage.image = UIImage(named: indexPath.row % 2 == 0 ? "꿀벌" : "아기사슴")
        return cell
    }


}
