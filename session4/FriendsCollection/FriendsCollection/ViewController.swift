//
//  ViewController.swift
//  FriendsCollection
//
//  Created by MaraMincho on 2023/05/18.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var numerofCell:Int = 10
    let cellIdentifier: String = "cell"
    
    var friends: [Friend] = []
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //tableview에서는 indexpath.row
        //collectionView에서는 indexpath.item
        
        self.numerofCell += 1
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FriendsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! FriendsCollectionViewCell
        
        let firend: Friend = self.friends[indexPath.item]
        
        cell.nameAgeLabel.text = firend.nameAndAge
        cell.addressLabel.text = firend.fullAddress
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let halfWidth: CGFloat = self.view.bounds.width / 2

        return CGSize(width: halfWidth - 30, height: 90)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        let flowLayout:UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout() //UICollectionViewLayout의 인스턴스
        flowLayout.sectionInset = UIEdgeInsets.zero //프로퍼티 세팅 //섹션 인셋조정
        flowLayout.minimumLineSpacing = 10 //줄 간의 거리가 10보다는 컸으면 좋겠다.
        flowLayout.minimumInteritemSpacing = 10 //아이템 간의 거리가 10보다는 컸으면
//        let halfWidth: CGFloat = self.view.bounds.width / 2
//        flowLayout.estimatedItemSize = CGSize(width: halfWidth - 30, height: 90) //사이즈는 반보다는 작게 높이는 90
        self.collectionView.collectionViewLayout = flowLayout
        
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            print("error")
            return
        }
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }
        catch{
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view.
        self.collectionView.reloadData()
    }

}

