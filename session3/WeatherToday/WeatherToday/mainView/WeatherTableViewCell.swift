//
//  WeatherTableViewCell.swift
//  WeatherToday


import UIKit

class WeatherTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // MARK: - 셀에 들어갈 국가 이름과 이미지 뷰
    var countryLabel:UILabel = {
        let lb = UILabel()
        return lb
    }()
    var conuntryFlagImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        //imageView.backgroundColor = .red
        //UIImage(systemName: <#T##String#>)으로 하면 안됨...
        return imageView
    }()
    
    // MARK: - 컨스트레인트 조정
    func setUpCell() {
        contentView.addSubview(conuntryFlagImageView)
        conuntryFlagImageView.snp.makeConstraints { make in
            
            make.top.bottom.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(15)
        }
        contentView.addSubview(countryLabel)
        countryLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(conuntryFlagImageView.snp.trailing).offset(30)
            //make.leading.equalTo(conuntryFlagImageView).offset(15)
        }
        
    }
    func setUpLabel() {
        //mainLabel.text = "1"
        countryLabel.textColor = .black
        countryLabel.font = UIFont.systemFont(ofSize: 32)
        countryLabel.textAlignment = .center
    }
    
    let cellIdentifier = "weatherCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellIdentifier)
        setUpCell()
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
