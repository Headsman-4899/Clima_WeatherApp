//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var networkManager = NetworkManager()
    
    var city: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
    }
    
    

    @IBAction func cityTextFieldDidChange(_ sender: UITextField) {
        city = sender.text ?? ""
    }
    
    @IBAction func searchButtonDidTap(_ sender: UIButton) {
        networkManager.getWeatherInfo(with: city)
        textField.text = ""
        city = ""
    }
}

extension WeatherViewController: NetworkManagerDelegate {
    
    func getWeatherInfo(with weatherModel: WeatherResponse) {
        conditionImageView.image = UIImage(systemName: weatherModel.weather[0].weatherIcon)
        temperatureLabel.text = String(format: "%.1f", weatherModel.main.tempCelc)
        cityLabel.text = weatherModel.name
        
    }
    
}



