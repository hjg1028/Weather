//
//  ViewController.swift
//  Weather
//
//  Created by nanami on 11/10/15.
//  Copyright © 2015 Jin. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tv: UITextView!
    
    @IBAction func buttonClicked(sender: AnyObject!) {
         try! loadWeatherData()
    }
    
    func loadWeatherData() throws {
        
        let url = NSURL(string: "http://www.weather.com.cn/adat/sk/101010100.html")!
        let data: NSData = NSData(contentsOfURL: url)!
        
        
        guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
            else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorCannotOpenFile, userInfo: nil)
        }
        
        let weatherInfo = json.objectForKey("weatherinfo")!
        
        let city = weatherInfo.objectForKey("city")!
        let wind = weatherInfo.objectForKey("WD")!
        let temp = weatherInfo.objectForKey("temp")!
        let time = weatherInfo.objectForKey("time")!
        let ws = weatherInfo.objectForKey("WS")!
        let sd = weatherInfo.objectForKey("SD")!
        
        
        tv.text = "City:\t\t\t\(city)\nTemperature:\t\(temp)℃\nWind:\t\t\t\(wind)\(ws)\nHumidity:\t\t\(sd)\nUpdate time:\t\(time)"
        
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

