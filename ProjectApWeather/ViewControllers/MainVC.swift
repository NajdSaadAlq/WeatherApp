//
//  ViewController.swift
//  ProjectApWeather
//
//  Created by Najd Alquarishi on 17/12/2021.
//

import UIKit
import Alamofire

class MainVC: UIViewController {


    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var lodertempAV: UIActivityIndicatorView!
    @IBOutlet weak var loderPressureAV: UIActivityIndicatorView!
    @IBOutlet weak var loderhumidityAV: UIActivityIndicatorView!
    @IBOutlet weak var lodercitynameAV: UIActivityIndicatorView!
    
    
    var cityId = "108410"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(cityChanged), name: NSNotification.Name(rawValue: "cityVlueChnged"), object: nil)
        getCityWeatharInfo()
        

    }
    
    func getCityWeatharInfo(){
        
        lodercitynameAV.startAnimating()
        lodertempAV.startAnimating()
        loderPressureAV.startAnimating()
        loderhumidityAV.startAnimating()
        
        let params = ["id" : cityId, "lang" : "en" , "appid" : "33488afb423814df369b9bd4baeb8e3c"]
        
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            
            if let result = response.value{
                let JSON = result as! NSDictionary
                let city = JSON["name"] as! String
                self.cityLabel.text = city
                self.lodercitynameAV.stopAnimating()
                let main = JSON["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                self.lodertempAV.stopAnimating()
                let pressure = main["pressure"] as! Double
                self.loderPressureAV.stopAnimating()
                let humidity = main["humidity"] as! Int
                self.loderhumidityAV.stopAnimating()
                
                temp = temp - 272.15
                temp = Double(round(1000 * temp) / 1000)
                self.tempLabel.text = "\(temp)°"
                self.pressureLabel.text = "\(pressure)"
                self.humidityLabel.text = "\(humidity)"
             
            }
        }
    }
    
    @objc func cityChanged(notification:Notification ){
        if let city =  notification.userInfo?["city"] as? City{
           // cityLabel.text = city.name
            cityId = city.id
            getCityWeatharInfo()
        }
    }
}

