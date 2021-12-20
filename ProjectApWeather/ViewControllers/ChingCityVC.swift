//
//  ChingCityVC.swift
//  ProjectApWeather
//
//  Created by Najd Alquarishi on 20/12/2021.
//

import UIKit

class ChingCityVC: UIViewController {

    var cityArray = [City(name: "الدمام", id: "110336"),
                     City(name: "الرياض", id: "108410"),
                     City(name: "جدة", id: "105343"),
                     City(name: "مكة المكرمة", id: "104514"),
                     City(name: "المدينة المنورة", id: "109224"),
                     City(name: "دبي", id: "292223"),
                     City(name: "أبوظبي", id: "292968"),
                     City(name: "الكويت", id: "285570"),
                     City(name: "تركيا", id: "298795"),
                     City(name: "لندن", id: "1006984"),
                     City(name: "نيويورك", id: "5039192"),
                     City(name: "سياتل", id: "5809844"),
                     City(name: "اليابان", id: "1861060"),
                     City(name: "طوكيو", id: "1850147"),
                     City(name: "الاردن", id: "248816"),
                     City(name: "تونس", id: "2464461"),
                     City(name: "عمان", id: "286963"),
                     City(name: "قطر", id: "289688"),
                     City(name: "روسيا", id: "2017370"),
                     City(name: "المغرب", id: "2542007"),
                     City(name: "باريس", id: "4717560")
    ]

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
