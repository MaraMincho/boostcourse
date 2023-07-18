//
//  ViewController.swift
//  MyAlbum
//
//  Created by MaraMincho on 2023/05/18.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    
    private var customCollectionView: CustomUICollectionView!
    private let data = Data()
    // MARK: - 네비게이션 세팅
    func setNavigation() {
        //self.navigationController?.title = "앨범"
        self.navigationItem.title = "앨범"
        
    }
    
    func configureCollectionView() {
        customCollectionView = CustomCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setNavigation()
        // Do any additional setup after loading the view.
    }


}


struct Data {
    let memberName = ["효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린"]
}
