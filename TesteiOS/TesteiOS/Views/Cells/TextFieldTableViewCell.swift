//
//  TextFieldTableViewCell.swift
//  TesteiOS
//
//  Created by Lucas Santos on 27/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    

    @IBOutlet weak var textField: UITextField!
    
    var celula: Celula? {
        didSet {
            textField.text = nil
            textField.placeholder = celula?.message
            if celula?.typefield == TypeField.email /*|| celula?.typefield == TypeField.telNumber*/{
                isValidField = false
                self.textField.addTarget(self, action: #selector(self.textFieldChanged(_:)), for: .editingChanged)
            }
        }
    }
    
    var isValidField = false {
        didSet{
            if(isValidField){
                textField.layer.borderColor = UIColor.green.cgColor
            }else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.layer.borderWidth = 1.0
    }
    
    @objc func textFieldChanged(_ textField: UITextField){
        let type = celula?.typefield
        if(type == TypeField.email){
            if (textField.text?.isValidEmail())! {
                isValidField = true
            } else {
                isValidField = false
            }
        }else if celula?.typefield == TypeField.telNumber {
            
        }
    }
    
}

extension String {
    func isValidEmail() -> Bool{
        let stringPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let expression = try! NSRegularExpression(pattern: stringPattern, options: .caseInsensitive)
        return (expression.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil)
    }
    
    func isValidPhone() -> Bool{
        let stringPattern = "([0-9]{2}) [0-9]{4-5}\\-[0-9]{4}"
        let expression = try! NSRegularExpression(pattern: stringPattern, options: .caseInsensitive)
        return (expression.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil)
    }
}


