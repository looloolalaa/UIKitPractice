//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Kihyun Lee on 2023/01/06.
//

import UIKit

enum Section {
    case feed, board, post
}

class Feed: Hashable {
    let id: UUID
    let imageName: String
    
    init(imageName: String) {
        self.id = UUID()
        self.imageName = imageName
    }
    
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



class FirstViewController: UIViewController {
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Feed>!
    
    var datas = [
        "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
    ].map { Feed(imageName: $0) }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.myCollectionView.delegate = self
//        self.myCollectionView.dataSource = self
        
        self.dataSource = UICollectionViewDiffableDataSource<Section, Feed>(collectionView: self.myCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Feed) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
            cell.myLabel.text = "!" + self.datas[indexPath.item].imageName + "!"
            cell.myImage.image = UIImage(systemName: self.datas[indexPath.item].imageName)
            
            return cell
        }
        
        updateSnapshot()
        
        
        
        self.myCollectionView.collectionViewLayout = createCompositionalLayout()
        
    }
    
    func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Feed>()
        snapshot.appendSections([.feed])
        snapshot.appendItems(datas, toSection: .feed)
        
        dataSource.apply(snapshot)
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        switch sender {
        case minusButton:
            if !self.datas.isEmpty {
                self.datas.removeFirst()
            }
        case resetButton:
            self.datas = []
        case plusButton:
            self.datas.append(Feed(imageName: "pencil"))
        default:
            break
        }
//        self.myCollectionView.reloadData()
        updateSnapshot()
    }
    
}


//extension FirstViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.datas.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
//        cell.myLabel.text = datas[indexPath.item]
//        cell.myImage.image = UIImage(systemName: datas[indexPath.item])
//        return cell
//    }
//}



extension FirstViewController: UICollectionViewDelegate {
    
}

extension FirstViewController {
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .absolute(150))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        
        return layout
    }
}
