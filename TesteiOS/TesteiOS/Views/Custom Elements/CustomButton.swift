//
//  CustomButton.swift
//  TesteiOS
//
//  Created by Lucas Santos on 11/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    @IBOutlet weak var label: UILabel!
    
    let defaultRed = UIColor(red: 218/255, green: 1/255, blue: 1/255, alpha: 1.0)
    let pressedRed = UIColor(red: 235/255, green: 118/255, blue: 118/255, alpha: 1.0)
    
    override open var isHighlighted: Bool {
        didSet {
            self.backgroundColor = isHighlighted ? pressedRed : defaultRed
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = self.frame.size.height/2.0
        self.clipsToBounds = true
        
        self.contentEdgeInsets.left = 10
        self.contentEdgeInsets.right = 10
    
        self.backgroundColor = defaultRed
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.white, for: .highlighted)
    }
}

