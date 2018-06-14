//
//  ButtonTableViewCell.swift
//  TesteiOS
//
//  Created by Lucas Santos on 16/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var button: CustomButton!
    
    var celula: Celula? {
        didSet {
            button.setTitle(celula?.message, for: .normal)
            self.isHidden = (celula?.hidden)!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
