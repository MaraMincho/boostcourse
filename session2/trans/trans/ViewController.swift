//
//  ViewController.swift
//  trans
//
//  Created by 정다함 on 2023/05/09.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameFiled:UITextField!
    @IBOutlet weak var ageFiled:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpSetButton(_ sender: UIButton) {
        userInformation.instance.name = nameFiled.text
        userInformation.instance.age = ageFiled.text
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("1view will apper")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("1view did did Appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("1view will disapeear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("1view did disappear")
    }
}

