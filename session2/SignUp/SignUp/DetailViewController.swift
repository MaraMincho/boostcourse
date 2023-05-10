//
//  DetailViewController.swift
//  SignUp
//
//  Created by 정다함 on 2023/05/09.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - 전화번호
    let phoneLabel:UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        return label
    }()
    
    let phoneTextFiled:UITextField = {
        let tf = UITextField()
        tf.placeholder = "전화번호를 입력하세요"
        tf.addTarget(self, action: #selector(checkState), for: .valueChanged)
        return tf
    }()
    lazy var phoneStackView:UIStackView = {
        let st = UIStackView(arrangedSubviews: [ phoneLabel, phoneTextFiled
        ])
        st.alignment = .leading
        st.distribution = .fill
        return st
    }()
    
    // MARK: - 생년월일

    let bdLabel:UILabel = {
        let label = UILabel()
        label.text = "생년월일"
        return label
    }()
    
    let bdDateLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    lazy var bdStackView:UIStackView = {
        let st = UIStackView(arrangedSubviews: [ bdLabel, bdDateLabel
        ])
        st.alignment = .leading
        st.distribution = .fillEqually
        return st
    }()
    
    // MARK: - 데이트 피커
    
    let datePicker:UIDatePicker = {
        let dp = UIDatePicker()
        dp.timeZone = NSTimeZone.local
        dp.preferredDatePickerStyle = .wheels //데이트피커를 그냥 선언하면, 휠모양이 아닌 다른 UI가 나온다.
        dp.datePickerMode = .date //시간 날짜 등을 설정할 수 있는데 우리는 날짜만 원한다.
        dp.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged) // 라벨 바꾸기
        dp.addTarget(self, action: #selector(checkState), for: .valueChanged) //값 체크
        return dp
    }()
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMM/DD/YYYY"
        
        bdDateLabel.text = formatter.string(from: sender.date)
    }

    // MARK: - Button
    let cancelButton:UIButton = {
        let bt = UIButton()
        bt.setTitle("취소", for: .normal)
        bt.setTitleColor(.red, for: .normal)
        bt.addTarget(self, action: #selector(tuchCancelbutton(_:)), for: .touchUpInside)
        return bt
    }()
    @objc func tuchCancelbutton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    let backButton:UIButton = {
        let bt = UIButton()
        bt.setTitle("이전", for: .normal)
        bt.setTitleColor(.blue, for: .normal)
        bt.addTarget(self, action: #selector(touchBackButton(_:)), for: .touchUpInside)
        return bt
    }()
    @objc func touchBackButton(_ sender:UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    let signUpButton:UIButton = {
        let bt = UIButton()
        bt.isEnabled = false
        bt.setTitle("가입", for: .normal)
        bt.setTitleColor(.blue, for: .normal)
        bt.setTitle("가입", for: .disabled)
        bt.setTitleColor(.gray, for: .disabled)
        bt.addTarget(self, action: #selector(touchSignUpButton(_:)), for: .touchUpInside)
        return bt
    }()
    @objc func touchSignUpButton(_ sender: UIButton) {
        UserData.instance.bdDate = bdDateLabel.text
        UserData.instance.phoneNumber = phoneTextFiled.text
        navigationController?.popToRootViewController(animated: true)
    }
    lazy var buttonStackView:UIStackView = {
        let st = UIStackView(arrangedSubviews: [cancelButton, backButton, signUpButton])
        st.alignment = .center
        st.distribution = .fillEqually
        return st
    }()
    
    // MARK: - 상태가 바뀌었는지 체크하는 함수

    @objc func checkState() {
        if phoneTextFiled.text != "" && bdDateLabel.text != "" {
            signUpButton.isEnabled = true
        }
    }
    
    func setConstraints() {
        view.addSubview(phoneStackView)
        phoneStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        view.addSubview(bdStackView)
        bdStackView.snp.makeConstraints { make in
            make.top.equalTo(phoneStackView.snp.bottom).offset(30)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(bdStackView.snp.bottom).offset(30)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = .white
        setConstraints()
        phoneTextFiled.delegate = self
        let ges:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tabView(_:)))
        self.view.addGestureRecognizer(ges)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tabView(_ sender:UITapGestureRecognizer) {
                    //에디팅이 끝나면 키보드를 내림
            self.view.endEditing(true)
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

extension DetailViewController: UITextFieldDelegate {
    
}
