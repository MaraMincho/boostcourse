//
//  ViewController.swift
//  SignUp
//
//  Created by 정다함 on 2023/05/09.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - TextFiled모음
    let idTextFiled: UITextField = {
        let tf = UITextField()
        tf.placeholder = "ID"
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    let pwTextFiled: UITextField = {
        let tf = UITextField()
        tf.placeholder = "pw"
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    lazy var textFiledStackView:UIStackView = {
        let sv = UIStackView(arrangedSubviews: [idTextFiled, pwTextFiled])
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .equalCentering
        sv.spacing = 13
        return sv
    }()
    
    // MARK: - Button StackView

    let signInButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Sign In", for: .normal)
        bt.setTitleColor(.blue, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 15)
        return bt
    }()
    let signUpButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Sign UP", for: .normal)
        bt.setTitleColor(.red, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 15)
        bt.addTarget(self, action: #selector(secondPage), for: .touchUpInside)
        return bt
    }()
    
    @objc func secondPage() {
        let nextViewController = SignUpViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    lazy var buttonStackView:UIStackView = {
       let sv = UIStackView(arrangedSubviews: [ signInButton, signUpButton
                                              ])
        sv.spacing = 30
        
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fillProportionally
        return sv
    }()
    
    
    let logoImageView:UIButton = {
        let iv = UIButton()
        
        let btImage = UIImage(systemName: "star")?.withTintColor(.black, renderingMode: .alwaysOriginal).applyingSymbolConfiguration(UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 150)))
        iv.setImage(btImage, for: .normal)
        iv.contentMode = .scaleAspectFill
        iv.addTarget(self, action: #selector(getUserDataFromInstance(_:)), for: .touchUpInside)
        // increase the size of the image view
        return iv
    }()
    
    @objc func getUserDataFromInstance(_ sender:UIButton) {
        UserData.instance.getData()
    }
    
    // MARK: - MainStackView

    lazy var mainStackView:UIStackView = {
        let sv = UIStackView(arrangedSubviews: [logoImageView, textFiledStackView, buttonStackView])
        sv.spacing = 15
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalCentering
        return sv
    }()
    
    
    func setConstraints() {
        self.view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(130)
        }
        idTextFiled.snp.makeConstraints { make in
            make.width.equalTo(320)
            make.height.equalTo(50)
        }
        pwTextFiled.snp.makeConstraints { make in
            make.width.equalTo(320)
            make.height.equalTo(50)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    
}

