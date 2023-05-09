//
//  UserData.swift
//  SignUp
//
//  Created by 정다함 on 2023/05/10.
//

import Foundation


class UserData {
    static let instance = UserData()
    
    var userID:String?
    var userPW:String?
    var introduce:String?
    var bdDate:String?
    var phoneNumber:String?
    
    func getData() {
        print("ID = \(userID), PW = \(userPW), bdDate = \(String(describing: bdDate)), phoneNumber = \(phoneNumber)")
        print(introduce)
    }
}
