//
//  Interface.swift
//  FluidInterfaces
//
//  Created by Spock on 2019/6/24.
//  Copyright © 2019 Spock. All rights reserved.
//

import UIKit

struct Interface {
    var name: String
    var icon: UIImage
    var color: UIColor
    var type: InterfaceViewController.Type
}

extension Interface {
    
    public static var all: [Interface] {
        return [Interface(name: "Calculator button", icon: #imageLiteral(resourceName: "icon_calc"), color: UIColor(hex: 0x999999), type: CalculatorButtonInterfaceViewController.self)]
    }
}
