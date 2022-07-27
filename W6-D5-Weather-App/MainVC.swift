//
//  ViewController.swift
//  W6-D5-Weather-App
//
//  Created by mohammad on 26/12/1443 AH.
//

import UIKit
import Alamofire
class MainVC: UIViewController {
    
    
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var editbutton: UIButton!
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var pressureLable: UILabel!
    @IBOutlet weak var humidityLable: UILabel!
    var cityid = "108410"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        editbutton.layer.cornerRadius = 18
        NotificationCenter.default.addObserver(self, selector: #selector(cityChanged), name: NSNotification.Name(rawValue: "cityValueChanged"), object: nil)
        citychange()
        
    }
    
    func citychange() {
        let params = ["id": cityid, "appid": "11bb7522c4ec867ad78453271ddac45d"]
        loaderActivityIndicator.startAnimating()
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            if let result = response.value {
                let json = result as! NSDictionary
                let main = json["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                let pressure = main["pressure"] as! Double
                let humidity = main["humidity"] as! Double
                temp = round(temp - 272.15)
                temp = Double(round(1000 * temp) / 1000)
                self.loaderActivityIndicator.stopAnimating()
                self.tempLable.text = "\(temp)°"
                self.pressureLable.text = "\(pressure)"
                self.humidityLable.text = "\(humidity)"
            }
            
            
        }
        
    }
    
    
    
    @objc func cityChanged(notification:
                                Notification) {
        if let city = notification.userInfo?["city"] as? City {
            cityNameLable.text = city.name
            cityid = city.cityId
            citychange()
      
        }
    }
    
}

/*
 110336 - dammmam
 105343 - jeddah
 110690 - abha
 */
// test

