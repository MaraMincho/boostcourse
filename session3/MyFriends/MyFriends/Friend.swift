//
//  Friend.swift
//  MyFriends
//
//  Created by 정다함 on 2023/05/10.
//

import Foundation


struct Friend:Codable{
    
    struct Address:Codable {
        let country:String
        let city:String
    }
    let name:String
    let age:Int
    let addressInfo:Address
    var nameAndAge:String {
        return self.name + "\(self.age)"
    }
    
    var fullAddress:String {
        return self.addressInfo.country + "\(self.addressInfo.city)"
    }
    enum CodingKeys:String, CodingKey {
        case name, age
        case addressInfo = "address_info"
    }
}
