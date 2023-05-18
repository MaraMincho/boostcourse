//
//  ViewController.swift
//  AsyncExample
//
//  Created by MaraMincho on 2023/05/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView:UIImageView!
    
    @IBAction func touchUpButton(_ sender:UIButton) {
        //https://edmullen.net/test/rc.jpg
        let imageURL: URL = URL(string: "https://edmullen.net/test/rc.jpg")!
        //2023-05-18 14:54:21.367584+0900 AsyncExample[24424:315109] [CFNetwork] Synchronous URL loading of https://edmullen.net/test/rc.jpg should not occur on this application's main thread as it may lead to UI unresponsiveness. Please switch to an asynchronous networking API such as URLSession.
        
        //URL에서 데이터를 가져오는 코드가 메인 메서드에서 실행되기 때문에, 오류가 발생...
        //이 코드를 메인쓰레드에서 동작하지 않게 하기 위해 operationQueue를 활용한다.
        OperationQueue().addOperation {
            let imageData:Data = try! Data.init(contentsOf: imageURL)
            let dImage:UIImage = UIImage(data: imageData)!
            //UIImageView.image must be used from main thread only
            //UI와 관련된 코드는 무조건 메인쓰레드에서 동작하도록 해야 한다.
            //self.imageView?.image = dImage
            OperationQueue.main.addOperation {
                self.imageView?.image = dImage
            }
        }
        
        
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

