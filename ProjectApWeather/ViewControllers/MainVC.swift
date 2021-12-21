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


    @IBOutlet weak var cloudIconImageView: UIImageView!
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
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "Sunny.png")
                    self.dayFnucshin()
                case "01n" ://clear sky night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "Clear.png")
                    self.nightFnucshin()
                case "02d"://few clouds sun
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "PartlyCloudyDay.png")
                    self.dayFnucshin()
                case "02n"://few clouds night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "PartlyCloudyNight.png")
                    self.nightFnucshin()
                case "03d"://scattered clouds sun
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "PartlyCloudyDay.png")
                    self.dayFnucshin()
                case "03n"://scattered clouds night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "PartlyCloudyNight.png")
                    self.nightFnucshin()
                case "04d"://broken clouds sun
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "Cloudy.png")
                    self.dayFnucshin()
                case "04n"://broken clouds night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "Overcast.png")
                    self.nightFnucshin()
                case "09d"://shower rain sun
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "HeavyRainSwrsDay.png")
                    self.dayFnucshin()
                case "09n"://shower rain night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "HeavyRainSwrsNight.png")
                    self.nightFnucshin()
                case "10d"://rain sun
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "IsoRainSwrsDay.png")
                    self.dayFnucshin()
                case "10n"://rain night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "IsoRainSwrsNight.png")
                    self.nightFnucshin()
                case "11d"://thunderstorm sun
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "PartCloudRainThunderDay.png")
                    self.dayFnucshin()
                case "11n"://thunderstorm night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "PartCloudRainThunderNight.png")
                    self.nightFnucshin()
                case "13d"://snow sun
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "IsoSnowSwrsDay.png")
                    self.dayFnucshin()
                case "13n"://snow night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "IsoSnowSwrsNight.png")
                    self.nightFnucshin()
                case "50d"://mist sun
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "Mist.png")
                    self.dayFnucshin()
                case "50n"://mist night
                    self.cloudIconImageView.image = #imageLiteral(resourceName: "Mist.png")
                    self.nightFnucshin()
                default: break}
        }
        }
        }
    
    
    func dayFnucshin(){
        
        bagroindView.backgroundColor = UIColor(#colorLiteral(red: 0.699916482, green: 0.7820982933, blue: 0.8692715764, alpha: 1))
        tempTextLabel.textColor = UIColor.black
        tempLabel.textColor = UIColor.black
        iconTempImageView.tintColor = UIColor.black
        lodertempAV.tintColor = UIColor.black
        
        pressureTextLabel.textColor = UIColor.black
        pressureLabel.textColor = UIColor.black
        iconPressureImageView.tintColor = UIColor.black
        loderPressureAV.tintColor = UIColor.black
        
        humidityTextLabel.textColor = UIColor.black
        humidityLabel.textColor = UIColor.black
        iconHumidityImageView.tintColor = UIColor.black
        loderhumidityAV.tintColor = UIColor.black
        
        
    }
    
    func nightFnucshin(){
        
        bagroindView.backgroundColor =  UIColor( #colorLiteral(red: 0.09109144658, green: 0.1007531509, blue: 0.3106760383, alpha: 1))
        buttonBagroind.tintColor = UIColor.blue
        tempTextLabel.textColor = UIColor.white
        tempLabel.textColor = UIColor.white
        iconTempImageView.tintColor = UIColor.white
        lodertempAV.tintColor = UIColor.white
        
        pressureTextLabel.textColor = UIColor.white
        pressureLabel.textColor = UIColor.white
        iconPressureImageView.tintColor = UIColor.white
        loderPressureAV.tintColor = UIColor.white
        
        humidityTextLabel.textColor = UIColor.white
        humidityLabel.textColor = UIColor.white
        iconHumidityImageView.tintColor = UIColor.white
        loderhumidityAV.tintColor = UIColor.white
    }
    @objc func cityChanged(notification:Notification ){
        if let city =  notification.userInfo?["city"] as? City{
           // cityLabel.text = city.name
            cityId = city.id
            getCityWeatharInfo()
            
            
            
    
    }
}
}
