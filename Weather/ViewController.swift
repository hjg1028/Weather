//
//  ViewController.swift
//  Weather
//
//  Created by nanami on 11/10/15.
//  Copyright © 2015 Jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tv: UITextView!
    
    @IBAction func buttonClicked(sender: AnyObject!) {
        loadWeatherData()
    }
    
    func loadWeatherData() {
        
        let url = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
        let data = NSData(contentsOfURL: url!)
        
        do {
            
            let json : AnyObject! = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
            let weatherInfo = json.objectForKey("weatherinfo")!
            let city = weatherInfo.objectForKey("city")!
            let weather = weatherInfo.objectForKey("weather")
            let temp1 = weatherInfo.objectForKey("temp1")!
            let temp2 = weatherInfo.objectForKey("temp2")!
            let time = weatherInfo.objectForKey("ptime")!
            
            tv.text = "City: \(city)\nWeather: \(weather)\nTemperature: \(temp1)-\(temp2)\nUpdate time: \(time)"
            
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

