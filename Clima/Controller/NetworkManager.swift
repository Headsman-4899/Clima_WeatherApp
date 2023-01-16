//
//  NetworkManager.swift
//  Clima
//
//  Created by Daulet on 13.11.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate: AnyObject {
    func getWeatherInfo(with weatherModel: WeatherResponse)
}

struct NetworkManager {
    
    var delegate: NetworkManagerDelegate?
    
    func getWeatherInfo(with cityName: String) {
        //let apiKey = "530327497eaee1ce46e9d8b817857dd4"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=530327497eaee1ce46e9d8b817857dd4"
        
        AF.request(urlString).responseDecodable { (response: DataResponse<WeatherResponse, AFError>) in
            switch response.result {
            case .success(let weatherResponse):
                delegate?.getWeatherInfo(with: weatherResponse)
            case .failure(let error):
                print("Decode error: ", error.localizedDescription)
            }
        }
    }
}
