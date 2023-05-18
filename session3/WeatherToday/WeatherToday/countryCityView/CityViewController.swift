//
//  CityViewController.swift
//  WeatherToday
//


import UIKit

class CityViewController: UIViewController {

    // MARK: - set 테이블뷰

    let cellIdentifier = "cityCell"
    let cityTableView:UITableView = {
        let tb = UITableView()
        return tb
    }()
    //테이블뷰 컨스트레인트
    func setTableViewConstraints() {
        view.addSubview(cityTableView)
        cityTableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(additionalSafeAreaInsets)
        }
    }
    //테이블뷰 하위 설정
    func setTableViewDelegate() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.register(CityTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    //테이블뷰 코드 실행문
    func initTableView() {
        setTableViewDelegate()
        setTableViewConstraints()
    }
    
    // MARK: - SetNavigationItem 설정
    var navigationTitleString:String = ""
    func setNavigationItems() {
        navigationItem.title = navigationTitleString
        navigationController?.navigationBar.tintColor = .white
        var appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .strikethroughColor: UIColor.white, ]
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
    
    // MARK: - 시티 설정
    var citiesAssetName = ""
    var cities:[City] = []
    func setCitiesInfo() {
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset:NSDataAsset = NSDataAsset(name: citiesAssetName) else {
            
            return
        }
    
        do {
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        }
        catch {
            return
        }
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print(citiesAssetName)
        setCitiesInfo()
        setNavigationItems()
        initTableView()
        // Do any additional setup after loading the view.
    }
    
}
extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cityTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityTableViewCell
        cell.cityNameLabel.text = cities[indexPath.row].cityName
        cell.degreeLabel.text = "섭씨온도 : \(cities[indexPath.row].celsius), 화씨온도 : \(cities[indexPath.row].fcVal)"
        
        cell.rainyPredictLabel.text = "강수확률 \(cities[indexPath.row].rainfallProbability)%"
        
        cell.weatherForcastImageView.image = UIImage(imageLiteralResourceName: cities[indexPath.row].weatherImageName)
        
        cell.degreeLabel.textColor = cities[indexPath.row].degreeColor
        cell.rainyPredictLabel.textColor = cities[indexPath.row].rainyLabelColor

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVc = DetailViewController()
        
        //뒤로가기 했을 때 설렉된 것을 풀게 하기
        tableView.deselectRow(at: indexPath, animated: true)
        nextVc.currentCity = cities[indexPath.row]
        navigationController?.pushViewController(nextVc, animated: true)
    }
    
}
