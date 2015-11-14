//: Playground - noun: a place where people can play

import Cocoa

let url = NSURL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
let data = NSData(contentsOfURL: url!)
let json : AnyObject! = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
let weatherInfo = json.objectForKey("weatherinfo")!
let city = weatherInfo.objectForKey("city")!
let weather = weatherInfo.objectForKey("weather")!
let temp1 = weatherInfo.objectForKey("temp1")!
let temp2 = weatherInfo.objectForKey("temp2")!
let time = weatherInfo.objectForKey("ptime")!
let tv: String = "City: \(city)\nWeather: \(weather)\nTemperature: \(temp2)-\(temp1)\nUpdate time: \(time)"
