//
//  DetailViewController.swift
//  WeatherToday
//


import UIKit

class DetailViewController: UIViewController {
    var currentCity:City!
    // MARK: - 네비게이션 세팅
    var titleString:String = "하이"
    func setNavigationItems() {
        navigationItem.title = currentCity.cityName
        navigationController?.navigationBar.tintColor = .white
        var appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .strikethroughColor: UIColor.white, ]
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
    // MARK: - label 위젯
    let weatherInfoLabel:UILabel = {
        let lb = UILabel()
        lb.font = .boldSystemFont(ofSize: 15)
        lb.text = "독일"
        return lb
    }()
    let degreeLabel:UILabel = {
        let lb = UILabel()
        lb.text = "섭씨 화씨"
        return lb
    }()
    let rainyPredictLabel:UILabel = {
        let lb = UILabel()
        lb.text = "강수확ㅇ률 50"
        return lb
    }()
    lazy var labelStackView:UIStackView = {
        let st = UIStackView(arrangedSubviews: [weatherInfoLabel, degreeLabel, rainyPredictLabel])
        st.spacing = 10
        st.alignment = .center
        st.distribution = .fillEqually
        st.axis = NSLayoutConstraint.Axis.vertical
        st.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150)
        return st
    }()
    let weatherForcastImageView:UIImageView = {
        let iv = UIImageView()
        //iv.frame = CGRectMake(0, 0, 350, 350)
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    // MARK: - 위젯 내용 설정
    func setDataOfWidget() {
        weatherForcastImageView.image = UIImage(named: String(currentCity.weatherImageName))
        self.titleString = currentCity.cityName
        
        self.weatherInfoLabel.text = currentCity.korWeather
        
        self.degreeLabel.text = "섭씨온도 : \( self.currentCity.celsius), 화씨온도 : \(self.currentCity.fcVal)"
        self.degreeLabel.textColor = currentCity.degreeColor
        
        self.rainyPredictLabel.text = "강수확률 \( currentCity!.rainfallProbability)%"
        self.rainyPredictLabel.textColor = currentCity.rainyLabelColor
    }

    // MARK: - 오토레이아웃 설정
    func setConstraints() {
        view.addSubview(weatherForcastImageView)
        weatherForcastImageView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(350)
            
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.centerX.equalToSuperview()
        }
        view.addSubview(labelStackView)
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(weatherForcastImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }

    
    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationItems()
        setDataOfWidget()
        setConstraints()
        setConstraints()

        // Do any additional setup after loading the view.
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
