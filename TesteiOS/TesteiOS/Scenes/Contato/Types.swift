//
//  TypeField.swift
//  TesteiOS
//
//  Created by Lucas Santos on 13/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

enum TypeField : Int, Codable{
    case null = 0
    case text = 1
    case telNumber = 2
    case email = 3
}

enum TypeFieldString : String{
    case null = ""
    case text = "text"
    case telNumber = "telNumber"
    case email = "email"
}

enum Type : Int, Codable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}
