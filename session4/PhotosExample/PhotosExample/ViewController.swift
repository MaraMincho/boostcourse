//
//  ViewController.swift
//  PhotosExample
//
//  Created by MaraMincho on 2023/05/18.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifer:String = "cell"
    
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollcollection = cameraRoll.firstObject else {return }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        //최신순으로 정렬하는 fetchOptions를 세팅
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollcollection, options: fetchOptions)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let photoAurhorizationSatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAurhorizationSatus {
        case .authorized:
            print("접근 허가 됨")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        case .denied :
            print("접근 불허")
        case .notDetermined:
            print("아직 응답하지 않음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized :
                    print("사용자가 허가 함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                case .denied :
                    print("사용자가 불허 함")
                default : break
                }
            })
        case .restricted :
            print("접근 제한")
        case .limited:
            print("제한 적임")
        @unknown default:
            break
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath)
        let asset:PHAsset = fetchResult.object(at: indexPath.row)
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil) { image, _ in
            cell.imageView?.image = image
        }
        return cell
    }

}

