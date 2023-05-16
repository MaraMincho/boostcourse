//
//  CountryCityModel.swift
//  WeatherToday

//

import Foundation
import UIKit


var weatherDict:[Int : String] = [10 : "sunny", 11 : "cloudy", 12 : "rainy", 13 : "snowy"]
var korWeatherDict:[Int : String] = [10 : "맑음", 11: "흐림", 12: "비", 13: "눈"]

struct City:Codable {
    let cityName:String
    let state:Int
    let celsius:Double
    let rainfallProbability:Int
    lazy var fcVal = String(format: "%.2f", celsius * (9/5) + 32)
    lazy var weatherImageName = weatherDict[state]!
    lazy var korWeather = korWeatherDict[state]!
    lazy var degreeColor:UIColor = {
        var color = UIColor.black
        if celsius < 10 {
            color = .blue
        }
        return color
    }()
    lazy var rainyLabelColor:UIColor = {
        var color = UIColor.black
        if rainfallProbability > 50 {
            color = .orange
        }
        return color
    }()
    
    
    enum CodingKeys:String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }

}
