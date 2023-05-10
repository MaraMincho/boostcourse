
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton:UIButton!
    let cellIdentifier:String = "cell"
    let korean:[String] = "가나다라마바사아자차카파타하".map{String($0)}
    let english:[String] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{String($0)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    var dates: [String] = []
    let dateFormatter:DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .long // 이거 뭐임?
        df.timeStyle = .long // 이거 뭐임?
        return df
    }()
    
    @IBAction func touchUPAddButton(_ sender: UIButton) {
        let tempDate = Date()
        let tempString = dateFormatter.string(from: tempDate)
        dates.append(tempString)
        
        self.tableView.reloadSections(IndexSet(2...2), with: .fade)
        //self.tableView.reloadData() //테이블뷰를 다시 불러오는 함수
        
    }
}

//Type 'ViewController' does not conform to protocol 'UITableViewDataSource'
//-> UItableViewDelegate, UItableViewDataSource선언하면
//필수적으로 생성행할 함수가 있다.

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    // MARK: - 테이블뷰를 만들 때 필수적으로 생성해야하는 func
    
    //테이블뷰의 개수를 설정하는 함수들이다. 갯수는 섹션마다 다를 수 있다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default :
            return 0
        }
    }
    //테이블뷰의 셀의 모양을 생성하는 함수이다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        var text = ""
        switch indexPath.section {
        case 0:
            text = korean[indexPath.row]
        case 1:
            text = english[indexPath.row]
        case 2:
            text = dates[indexPath.row]
        default :
            text = ""
        }
        cell.textLabel?.text = text
        return cell
    }
    //섹션의 개수를 설정하는 함수이다.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //섹션의 헤더의 이름을 설정하는 함수이다.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "한국어"
        case 1:
            return "영어"
        case 2:
            return "동적 셀 섹션"
        default :
            return "뭐예용?"
        }
    }
    
    
}

