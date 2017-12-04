//
//  UIColor.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit
/**
 UIColor extension that add a whole bunch of utility functions like:
 - HTML/CSS RGB format conversion (i.e. 0x124672)
 - lighter color
 - darker color
 - color with modified brightness
 */
extension UIColor {
    /**
     Construct a UIColor using an HTML/CSS RGB formatted value and an alpha value

     :param: rgbValue RGB value
     :param: alpha color alpha value

     :returns: an UIColor instance that represent the required color
     */
    class func colorWithRGB(rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255
        let blue = CGFloat(rgbValue & 0xFF) / 255

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    /**
     Returns a lighter color by the provided percentage

     :param: lighting percent percentage
     :returns: lighter UIColor
     */
    func lighterColor(percent: Double) -> UIColor {
        return colorWithBrightnessFactor(factor: CGFloat(1 + percent))
    }

    /**
     Returns a darker color by the provided percentage

     :param: darking percent percentage
     :returns: darker UIColor
     */
    func darkerColor(percent: Double) -> UIColor {
        return colorWithBrightnessFactor(factor: CGFloat(1 - percent))
    }

    /**
     Return a modified color using the brightness factor provided

     :param: factor brightness factor
     :returns: modified color
     */
    func colorWithBrightnessFactor(factor: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * factor, alpha: alpha)
        } else {
            return self
        }
    }

  /**
   Creates an UIColor Object based on provided RGB value in integer

   - parameter red:   Red Value in integer (0-255)
   - parameter green: Green Value in integer (0-255)
   - parameter blue:  Blue Value in integer (0-255)

   - returns: UIColor with specified RGB values
   */
    convenience init(red: Int, green: Int, blue: Int) {
      assert(red >= 0 && red <= 255, "Invalid red component")
      assert(green >= 0 && green <= 255, "Invalid green component")
      assert(blue >= 0 && blue <= 255, "Invalid blue component")

      self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

  /**
   Creates an UIColor from an Hexadecimal code

   - parameter netHex: HexCode in 0xd234ef format

   - returns: UIColor with specified HEX CODE
   */
    convenience init(netHex: Int) {
      self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
  
  /**
   Creates an UIColor from HEX String in "#363636" format
   
   - parameter hexString: HEX String in "#363636" format
   
   - returns: UIColor from HexString
   */
    convenience init(hexString: String) {
			
      let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
      let scanner          = Scanner(string: hexString as String)
			
      if hexString.hasPrefix("#") {
        scanner.scanLocation = 1
      }
      
      var color: UInt32 = 0
      scanner.scanHexInt32(&color)
			
      let mask = 0x000000FF
      let r = Int(color >> 16) & mask
      let g = Int(color >> 8) & mask
      let b = Int(color) & mask
      
      let red   = CGFloat(r) / 255.0
      let green = CGFloat(g) / 255.0
      let blue  = CGFloat(b) / 255.0
      
      self.init(red:red, green:green, blue:blue, alpha:1)
    }
  
  /**
   Converts an UIColor to HexString
   
   - returns: HexString generated from UIColor
   */
    func toHexString() -> String {
      var r: CGFloat = 0
      var g: CGFloat = 0
      var b: CGFloat = 0
      var a: CGFloat = 0
      
      getRed(&r, green: &g, blue: &b, alpha: &a)
      
      let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
      
      return NSString(format:"#%06x", rgb) as String
    }

}
