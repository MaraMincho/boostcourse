//
//  ViewController.swift
//  MyFriends
//
//  Created by 정다함 on 2023/05/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let cellIdentifier: String = "cell"

    var friends: [Friend] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let friend = self.friends[indexPath.row]
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress 
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }catch {
            return
        }
    }
    

}
