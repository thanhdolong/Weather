//
//  DefaultTheme.swift
//  dopravaBrno
//
//  Created by Thành Đỗ Long on 07/04/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Foundation
import UIKit

public struct DefaultTheme: ThemeStrategy {
    var fonts: FontScheme
    var colours: ColourScheme
    
    var barStyle: UIBarStyle = .default
    
    var keyboardAppearance: UIKeyboardAppearance = .default
    
    init(colours: ColourScheme = DefaultColours(),
         fonts: FontScheme = DefaultFonts()) {
        self.colours = colours
        self.fonts = fonts
    }
    
    struct DefaultColours: ColourScheme {
        let mainColor: UIColor = UIColor(hexString: "#FFCC33")
        let secondaryColor: UIColor = UIColor(hexString: "#2F91FF")
        
        let shareColor: UIColor = UIColor(hexString: "#FF8847")
        
        let primaryTextColor: UIColor = UIColor(hexString: "#333333")
        let secondaryTextColor: UIColor = UIColor(hexString: "#2F91FF")
    }

    struct DefaultFonts: FontScheme {
        let headlineFont: UIFont = UIFont(name: "Montserrat-Medium", size: 20)!
        let subHeadlineFont: UIFont = UIFont(name: "Montserrat-Medium", size: 16)!
        
        let forecastHeadlineFont: UIFont = UIFont(name: "Montserrat-Semibold", size: 14)!
        let forecastSubHeadlineFont: UIFont = UIFont(name: "Montserrat-Medium", size: 18)!
        let forecastTemperatureFont: UIFont = UIFont(name: "Montserrat-Light", size: 44)!
        
        let bodyFont: UIFont = UIFont(name: "Montserrat-Medium", size: 14)!
        
        let tapBarFont: UIFont = UIFont(name: "Montserrat-Semibold", size: 10)!
        let navigationBarFont: UIFont = UIFont(name: "Montserrat-Medium", size: 16)!
    }
}
