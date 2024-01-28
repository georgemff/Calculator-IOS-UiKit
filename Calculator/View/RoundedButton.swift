//
//  RoundedButton.swift
//  Calculator
//
//  Created by Gadeishvili on 27.01.24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 0.5 * self.bounds.size.height
        self.clipsToBounds = true
    }

}
