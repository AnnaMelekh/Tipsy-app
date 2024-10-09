//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Anna Melekhina on 09.10.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var tip: Float = 0
    var numberOfPeople: Float = 2
    var value: Float = 0
    var billEntered: Float = 0
    
    mutating func getValue(billEntered: Float) -> Float {
       
        value = (billEntered + (billEntered * tip/100)) / numberOfPeople
        return value
    }
}
