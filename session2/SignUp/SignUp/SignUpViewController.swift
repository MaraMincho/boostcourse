//
//  SignUpViewController.swift
//  SignUp
//
//  Created by 정다함 on 2023/05/09.
//

import UIKit
import SnapKit
class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    

    
    let idTextFiled:UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "아이디를 입력하세요"
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let pwTextFiled:UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "비밀번호를 입력하세요"
        tf.keyboardType = .phonePad
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let pwCheckTextFiled:UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "비밀번호를 다시 입력하세요"
        tf.keyboardType = .phonePad
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        return tf
    }()
    
    @objc func checkPassword() {
        print("값 바뀜")
        if pwTextFiled.text == pwCheckTextFiled.text {
            nextButton.isEnabled = true
            print("gkdl")
        }else { nextButton.isEnabled = false}
    }
    
    lazy var textFiledStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [
            idTextFiled, pwTextFiled, pwCheckTextFiled
        ])
        st.axis = .vertical
        st.spacing = 20
        st.distribution = .fillProportionally
        
        
        return st
    }()
    
    let profileImage:UIButton = {
        let bt = UIButton()
        bt.setBackgroundImage(UIImage(systemName: "star"), for: .normal)
        bt.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        bt.addTarget(self, action: #selector(getPic), for: .touchUpInside)
        return bt
        
    }()
    
    @objc func getPic() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let tempImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.setBackgroundImage(tempImage, for: .normal)
        }
        self.dismiss(animated: true, completion: {
            print("이미지 픽 끝남")
        })
    }
    
    lazy var topStackview:UIStackView = {
        let st = UIStackView(arrangedSubviews: [profileImage, textFiledStackView])
        st.axis = .horizontal
        st.alignment = .center
        
        return st
    }()
    // MARK: - 소개 설명

    let introduceTextField:UITextView = {
        let tf = UITextView()
        tf.backgroundColor = .orange
        tf.font = .systemFont(ofSize: 30)
        return tf
    }()
    
    
    
    // MARK: - Button 설정
    
    
    //취소 버튼
    let cancelButton:UIButton = {
        let bt = UIButton()
        bt.setTitle("취소", for: .normal)
        bt.setTitleColor(.red, for: .normal)
        bt.addTarget(self, action: #selector(popScreen), for: .touchUpInside)
        return bt
    }()
    
    //함수
    @objc func popScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    
    //다음 버튼 (비밀번호가 같을 때만 활성화 된다.)
    let nextButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("다음", for: .disabled)
        bt.setTitle("다음", for: .normal)
        bt.isEnabled = false
        bt.setTitleColor(.blue, for: .normal)
        bt.setTitleColor(.gray, for: .disabled)
        bt.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        return bt
    }()
    
    @objc func nextScreen() {
        UserData.instance.userID = idTextFiled.text
        UserData.instance.userPW = pwTextFiled.text
        UserData.instance.introduce = introduceTextField.text
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    
    lazy var buttonStackView:UIStackView = {
        let stView = UIStackView(arrangedSubviews: [cancelButton, nextButton])
        stView.axis = .horizontal
        stView.distribution = .fillEqually
        return stView
    }()
    
    lazy var mainStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [topStackview, introduceTextField, buttonStackView
                                                
        ])
        st.axis = .vertical
        st.spacing = 15
        st.distribution = .fill
        return st
    }()
    
    // MARK: - 오토레이아웃 설정
    func setConstraints() {
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        // Add new constraints
        topStackview.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
        profileImage.snp.makeConstraints { make in
            make.width.equalTo(topStackview.snp.width).multipliedBy(0.3)
            make.height.equalTo(topStackview.snp.height)
            make.leading.trailing.equalToSuperview()
            
        }
        
        textFiledStackView.snp.makeConstraints { make in
            make.width.equalTo(topStackview.snp.width).multipliedBy(0.7) // Change the multiplier to 0.75
            make.trailing.top.equalToSuperview()
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        view.backgroundColor = .white
        pwTextFiled.delegate = self
        pwCheckTextFiled.delegate = self
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

extension SignUpViewController {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if pwTextFiled.text == pwCheckTextFiled.text {
            nextButton.isEnabled = true
        }else {nextButton.isEnabled = false}
    }
}
