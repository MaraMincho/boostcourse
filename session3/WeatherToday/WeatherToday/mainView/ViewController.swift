//
//  ViewController.swift
//  WeatherToday
//


import UIKit
import SnapKit

class ViewController: UIViewController  {
    let cellIdentifier:String = "weatherCell"
    // MARK: - 오토레이아웃 설정
    func setConstraints() {
        view.addSubview(weatherTableView)
        weatherTableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
    // MARK: - 네비게이션 아이템 세팅
    func setNavItems() {
        navigationItem.backBarButtonItem?.isHidden = true
        navigationItem.title = "세계 날씨"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        //navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 105)
    }
    
    // MARK: - 테이블뷰
    let weatherTableView:UITableView = {
        let tb:UITableView = UITableView()
        return tb
    }()
    //셀 등록 및 델리게이트와 데이터 소스 설정
    func setTableViewInit() {
        weatherTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
    
    // MARK: - 데이터 관리
    
    //나라 설정
    var countries:[Country] = []
    func getDataFromFile() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset:NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        }
        catch {
            return
        }
    }

    
    // MARK: - 생명주기 관리
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getDataFromFile()
        setConstraints()
        setTableViewInit()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavItems()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    //셀 아이덴티파이어가 제대로 선언되지 않으면 에러를 발생시킨다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeatherTableViewCell
        //셀 라벨 설정
        cell.countryLabel.text = self.countries[indexPath.row].countryName
        cell.countryLabel.font = UIFont.systemFont(ofSize: 15)
        
        //셀 이미지 설정
        
        cell.conuntryFlagImageView.image = UIImage(named: self.countries[indexPath.row].flagName)
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    //2023-05-16 13:11:23.392192+0900 WeatherToday[13978:175787] [Warning] Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a table view cell's content view. We're considering the collapse unintentional and using standard height instead. Cell: <WeatherToday.WeatherTableViewCell: 0x15884f200; baseClass = UITableViewCell; frame = (0 0; 393 44); autoresize = W; layer = <CALayer: 0x600001aa7040>>

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(45)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = CityViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        nextVC.navigationTitleString = "\(self.countries[indexPath.row].countryName)"
        nextVC.citiesAssetName = "\(self.countries[indexPath.row].assetName)"
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
