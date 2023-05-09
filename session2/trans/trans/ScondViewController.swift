//
//  ScondViewController.swift
//  trans
//
//  Created by 정다함 on 2023/05/09.
//

import UIKit

class ScondViewController: UIViewController {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var ageLabel:UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2view will apper")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("2view did did Appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("2view will disapeear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("2view did disappear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = userInformation.instance.name
        ageLabel.text = userInformation.instance.age
        print("2view did load")
        // Do any additional setup after loading the view.
    }
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true )
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
