
import Foundation

struct Country:Codable {
    let countryName:String
    let assetName:String
    lazy var flagName = "flag_\(assetName)"
    
    enum CodingKeys:String, CodingKey {
        case assetName = "asset_name"
        case countryName = "korean_name"
    }
}

