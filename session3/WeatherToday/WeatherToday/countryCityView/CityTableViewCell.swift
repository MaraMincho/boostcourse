//
//  CityTableViewCell.swift
//  WeatherToday
//


import UIKit

class CityTableViewCell: UITableViewCell {
    
    let cellIdentifier = "cityCell"
    // MARK: - 라벨
    let cityNameLabel:UILabel = {
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
        let st = UIStackView(arrangedSubviews: [cityNameLabel, degreeLabel, rainyPredictLabel])
        st.spacing = 10
        st.alignment = .center
        st.distribution = .fillEqually
        st.axis = NSLayoutConstraint.Axis.vertical
        return st
    }()
    
    
    // MARK: - 이미지 뷰

    let weatherForcastImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "rainy")
        return iv
    }()
    
    // MARK: - 오토레이아웃 적용

    func setItemConstraints() {
        contentView.addSubview(weatherForcastImageView)
        weatherForcastImageView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.top.leading.bottom.equalTo(safeAreaLayoutGuide).inset(20)
        }
        contentView.addSubview(labelStackView)
        labelStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(weatherForcastImageView.snp.trailing).offset(20)
        }
    }

    // MARK: - 시작부분

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellIdentifier)
        setItemConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
