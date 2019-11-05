//
//  JsonURLSession.swift
//  Lab6.1
//
//  Created by Toni K on 13/10/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class JsonURLSession: NSObject {
    
    let urlAddress = "https://api.openweathermap.org/data/2.5/weather?q="
    let key = "&APPID=65dbec3aae5e5bf9000c7a956c8b76f6"
    var city = ""
    
    private var observers = [JsonURLSessionObserver] ()
    
    func downloadWeatherData (observer : JsonURLSessionObserver, cityParam : String) {
        observers.append(observer)
        self.city = cityParam
        downloadData()
    }
    
    // Retrieve data from the url
    private func downloadData() {
        let url = urlAddress + city + key
        print (url)
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        for observer in self.observers {
                            observer.notify(response : res)
                        }
                    } catch let error {
                        print (error)
                    }
                }
                }.resume()
        }
    }
}
