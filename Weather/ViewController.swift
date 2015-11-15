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
        
        let url = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")!
        let data: NSData = NSData(contentsOfURL: url)!
        
        
        guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
            else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorCannotOpenFile, userInfo: nil)
        }
        
        let weatherInfo = json.objectForKey("weatherinfo")!
        
        //{"weatherinfo":{"city":"北京","cityid":"101010100","temp1":"15℃","temp2":"5℃","weather":"多云","img1":"d1.gif","img2":"n1.gif","ptime":"08:00"}}
        
        let city = weatherInfo.objectForKey("city")!
        let cityID = weatherInfo.objectForKey("cityid")!
        let temp1 = weatherInfo.objectForKey("temp1")!
        let temp2 = weatherInfo.objectForKey("temp2")!
        let weather = weatherInfo.objectForKey("weather")!
        let ptime = weatherInfo.objectForKey("ptime")!
        
        tv.text = "\(city)\n\(temp2)-\(temp1)\n\(weather)\n\(ptime)\n\(cityID)"
        
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

