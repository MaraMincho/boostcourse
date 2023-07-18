//
//  CustomCollectionViewCell.swift
//  MyAlbum
//
//  Created by MaraMincho on 2023/05/18.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var memberNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "임시임"
        lb.font = .systemFont(ofSize: 25)
        lb.textAlignment = .center
        return lb
    }()
    
    
    func setUpCell() {
        contentView.addSubview(memberNameLabel)
        memberNameLabel.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    init(memberNameLabel: UILabel!) {
        super.init(frame: .zero)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
