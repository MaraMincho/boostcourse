//
//  ImageZoomViewController.swift
//  PhotosExample
//
//  Created by MaraMincho on 2023/05/18.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {
    var asset:PHAsset! //전 화면에서 받아올 에셋
    let imageManager: PHCachingImageManager = PHCachingImageManager() //
    
    @IBOutlet weak var imageView: UIImageView! //보여줄 이미지 뷰
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView //스크롤 뷰가 줌을 해줄 뷰는 누구냐?
        //대상을 지정하는 것
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill, options: nil) { image, _ in
            self.imageView.image = image
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
