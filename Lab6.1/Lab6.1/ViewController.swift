//
//  ViewController.swift
//  Lab6.1
//
//  Created by Toni K on 13/10/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

struct Response: Codable {
    let weather : [Weather]
    let main : Dictionary<String, Float>
}

struct Weather : Codable {
    let id : Int
    let main : String
    let icon : String
}

protocol JsonURLSessionObserver {
    var id : Int{get}
    func notify(response : Response)
}

class ViewController: UIViewController, JsonURLSessionObserver {
    
    var id: Int = 0
    var weather = ""
    var weatherSymbol = ""
    var weatherTemp: Float = 0
    
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textViewTemperature: UILabel!
    @IBOutlet weak var textViewWeather: UILabel!
    @IBOutlet weak var imageViewWeather: UIImageView!
    
    func notify(response : Response) {
        let originalweatherTemp = Float32(response.main["temp"] ?? 0)-273.15
        let weatherTempCelcius = Float(round(10*originalweatherTemp)/10)
        self.weatherTemp = weatherTempCelcius
        self.weather = response.weather[0].main
        self.weatherSymbol = response.weather[0].icon
        self.setWeatherSymbol(symbolCode: weatherSymbol)
        self.updateUI()
    }
    
    @IBAction func buttonGetWeather(_ sender: Any) {
        UI {
            let terve = JsonURLSession()
            terve.downloadWeatherData(observer: self, cityParam : self.textFieldCity.text!)
        }
    }
    
    func setWeatherSymbol(symbolCode : String) {
        let symbolUrlAddress = "https://openweathermap.org/img/w/" + symbolCode + ".png"
        if let symbolUrlAddress = URL(string:symbolUrlAddress) {
            let data = try? Data(contentsOf: symbolUrlAddress)
            if let symbolData = data {
                let imageSymbol = UIImage(data: symbolData)
                UI {
                    self.imageViewWeather.image = imageSymbol
                }
            }
        }
    }
    
    func updateUI() {
        UI {
            self.textViewWeather.text = self.weather
            self.textViewTemperature.text = String(self.weatherTemp) + "°C"
        }
    }
    
    func UI(_ block: @escaping ()->Void) {
        DispatchQueue.main.async(execute: block)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
