//
//  ChingCityVC.swift
//  ProjectApWeather
//
//  Created by Najd Alquarishi on 20/12/2021.
//

import UIKit

class ChingCityVC: UIViewController {

    var cityArray = [City(name: "Riyadh"),
                     City(name: "Dammam"),
                     City(name: "Jeddah"),
                     City(name: "Makkah"),
                     City(name: "Madina El Monawara"),
                     City(name: "Dubai"),
                     City(name: "Abu Dhabi"),
                     City(name: "Kuwait"),
                     City(name: "Turkey")]

    var selectedCity: City? = nil
    
    @IBOutlet weak var citiysPickerView: UIPickerView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        citiysPickerView.delegate = self
        citiysPickerView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    @IBAction func cityTouchBoutton(_ sender: Any) {
        if let city = selectedCity{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cityVlueChnged"), object: nil, userInfo: ["city" : city])
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ChingCityVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        cityArray[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = cityArray[row]
    }
}
