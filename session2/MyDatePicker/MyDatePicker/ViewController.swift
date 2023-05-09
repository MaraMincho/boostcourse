//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 정다함 on 2023/05/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerChanged(_:)), for: .valueChanged)
        
    }
    
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var dataLbael: UILabel!
    let dateForamateer: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    @IBAction func didDatePickerChanged(_ sender:UIDatePicker) {
        print("value changed")
        
        let date:Date = self.datePicker.date
        
        let dateString: String = self.dateForamateer.string(from: date)
        dataLbael.text = dateString
    }
}

