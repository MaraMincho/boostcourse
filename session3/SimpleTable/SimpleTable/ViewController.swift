
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton:UIButton!
    let cellIdentifier:String = "cell"
<<<<<<< HEAD
    let customCellIndetifier:String = "customCeel"
=======
>>>>>>> master
    let korean:[String] = "가나다라마바사아자차카파타하".map{String($0)}
    let english:[String] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{String($0)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
<<<<<<< HEAD
    var dates: [[String]] = []
    let dateFormatter:DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .long // 이거 뭐임?
        
        return df
    }()
    let timeFormatter:DateFormatter = {
        let df = DateFormatter()
=======
    var dates: [String] = []
    let dateFormatter:DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .long // 이거 뭐임?
>>>>>>> master
        df.timeStyle = .long // 이거 뭐임?
        return df
    }()
    
    @IBAction func touchUPAddButton(_ sender: UIButton) {
<<<<<<< HEAD
        let curDate = Date()
        let tempDate = dateFormatter.string(from: curDate)
        let tempTime = timeFormatter.string(from: curDate)
        dates.append([tempDate, tempTime])
=======
        let tempDate = Date()
        let tempString = dateFormatter.string(from: tempDate)
        dates.append(tempString)
>>>>>>> master
        
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
<<<<<<< HEAD
        if indexPath.section < 2 {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            let text:String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            return cell
        }
        else {
            //셀을 재사용 한다는 말임 뷰가 재사용 된다?
            //테이블뷰에 여러 셀을
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIndetifier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel.text = dates[indexPath.row][0]
            cell.rightLabel.text = dates[indexPath.row][1]
            return cell
        }
=======
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
>>>>>>> master
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
    
    
<<<<<<< HEAD
    // MARK: - Navigation
    //세그는 여러개를 가질 수 있다.
    //그럴 경우 세그의 아이덴티파이어를 통해서 구별하면 된다.

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view
        //segue.identifier
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        //굳이 이렇게 다른 요소로 접근해서 바꿔줘야 하는지?
        //nextViewController.textLabel.text = cell.textLabel?.text
        //이렇게 하게 된다면 nextViewController는 메모리에 적재되어있지만
        //nextViewController.textLabel은 메모리에 적제 되지 않았다.
        //따라서 직접 접근하면 에러가 날 수 있다.
        nextViewController.textToSet = cell.textLabel?.text
    }
    
    
=======
>>>>>>> master
}

