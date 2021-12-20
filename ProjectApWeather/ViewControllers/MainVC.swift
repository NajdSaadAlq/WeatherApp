//
//  ViewController.swift
//  ProjectApWeather
//
//  Created by Najd Alquarishi on 17/12/2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainVC: UIViewController {


    @IBOutlet weak var weathardescriptionLabel: UILabel!
    @IBOutlet weak var weatharMinLabel: UILabel!
    @IBOutlet weak var bagroindView: UIView!
    @IBOutlet weak var weatharImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var buttonBagroind: UIButton!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempTextLabel: UILabel!
    @IBOutlet weak var iconTempImageView: UIImageView!
    @IBOutlet weak var pressureTextLabel: UILabel!
    @IBOutlet weak var iconPressureImageView: UIImageView!
    @IBOutlet weak var humidityTextLabel: UILabel!
    @IBOutlet weak var iconHumidityImageView: UIImageView!
    
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
        
        let params = ["id" : cityId, "lang" : "ar" , "appid" : "33488afb423814df369b9bd4baeb8e3c"]
        
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            //MARK: IDNTFIAY
            if let result = response.value{
                let jsonres = JSON(result)
                let weathar = jsonres["weather"].array![0]
                let iconName = weathar["icon"].stringValue
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
                //MARK: THE THAME
                temp = temp - 272.15
                temp = Double(round(1000 * temp) / 1000)
                self.tempLabel.text = "\(temp)°"
                self.pressureLabel.text = "\(pressure)"
                self.humidityLabel.text = "\(humidity)%"
                self.weatharImageView.image = UIImage(named: iconName)
                self.weatharMinLabel.text = weathar["main"].stringValue //description
                self.weathardescriptionLabel.text = weathar["description"].stringValue
                
                switch iconName {
                case "01d" ://clear sky sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red:      0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                    
                case "01n" ://clear sky night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                               
                   
                case "02d"://few clouds sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                   
                case "02n"://few clouds night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                    
                case "03d"://scattered clouds sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                   
                case "03n"://scattered clouds night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                    
                case "04d"://broken clouds sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                    
                case "04n"://broken clouds night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                 
                    
                case "09d"://shower rain sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                    
                    
                case "09n"://shower rain night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                    
                case "10d"://rain sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                    
                case "10n"://rain night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                    
                case "11d"://thunderstorm sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                    
                case "11n"://thunderstorm night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                    
                case "13d"://snow sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                    
                case "13n"://snow night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                    
                case "50d"://mist sun
                    self.bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.8740803599, green: 0.6124646068, blue: 0.6009569764, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.black
                    self.tempLabel.textColor = UIColor.black
                    self.iconTempImageView.tintColor = UIColor.black
                    self.lodertempAV.backgroundColor = UIColor.black
                    
                    self.pressureTextLabel.textColor = UIColor.black
                    self.pressureLabel.textColor = UIColor.black
                    self.iconPressureImageView.tintColor = UIColor.black
                    self.loderPressureAV.backgroundColor = UIColor.black
                    
                    self.humidityTextLabel.textColor = UIColor.black
                    self.humidityLabel.textColor = UIColor.black
                    self.iconHumidityImageView.tintColor = UIColor.black
                    self.loderhumidityAV.backgroundColor = UIColor.black
                    
                case "50n"://mist night
                    self.bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
                    self.tempTextLabel.textColor = UIColor.white
                    self.tempLabel.textColor = UIColor.white
                    self.iconTempImageView.tintColor = UIColor.white
                    self.lodertempAV.backgroundColor = UIColor.white
                    
                    self.pressureTextLabel.textColor = UIColor.white
                    self.pressureLabel.textColor = UIColor.white
                    self.iconPressureImageView.tintColor = UIColor.white
                    self.loderPressureAV.backgroundColor = UIColor.white
                    
                    self.humidityTextLabel.textColor = UIColor.white
                    self.humidityLabel.textColor = UIColor.white
                    self.iconHumidityImageView.tintColor = UIColor.white
                    self.loderhumidityAV.backgroundColor = UIColor.white
                    
                    
                default: break}
                
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
