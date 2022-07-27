//
//  ChangeCityVC.swift
//  W6-D5-Weather-App
//
//  Created by mohammad on 27/12/1443 AH.
//

import UIKit

class ChangeCityVC: UIViewController {
    
    var citiesArray = [
        City(name: "الدمام", cityId: "110336"),
        City(name: "الرياض", cityId: "108410"),
        City(name: "جدة", cityId: "105343"),
        City(name: "ابها", cityId: "110690")
    ]
    
    /*
     110336 - dammmam
     105343 - jeddah
     110690 - abha
     */

    
    var selectedCity: City?
    @IBOutlet weak var citiesPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self
    }
    
    @IBAction func editCityButtonClicked(_ sender: Any) {
        if let city = selectedCity {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cityValueChanged"), object: nil, userInfo: ["city" : city])
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}

extension ChangeCityVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citiesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesArray[row].name
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = citiesArray[row]
    }
    
}

