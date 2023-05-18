//
//  ViewController.swift
//  PhotosExample
//
//  Created by MaraMincho on 2023/05/18.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver {
    
    //PHPhotoLibrarayObserver 프로토콜을 선언 할 시 다음과 같은 메서드를 추가해야 한다.
    func photoLibraryDidChange(_ changeInstance: PHChange) {//포토라이브러리가 바뀐다면 옵저버 처럼 실행되는 함수를 선언한다.
        guard let changes = changeInstance.changeDetails(for: fetchResult)
        else {return}
        fetchResult = changes.fetchResultAfterChanges
        
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifer:String = "cell"
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //row를 편집할 수 있게 하느냐
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let asset : PHAsset = self.fetchResult[indexPath.row]
            
            PHPhotoLibrary.shared().performChanges( {
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
            //편집을 할 때 에셋을 딜리트 하는 것이다.

        }
    }
    
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
        tableView.delegate = self
        let photoAurhorizationSatus = PHPhotoLibrary.authorizationStatus()
        
        PHPhotoLibrary.shared().register(self)
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

