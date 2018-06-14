//
//  ContatoModels.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

struct Celula : Codable{
    let id : Int
    let type : Type
    let message : String
    let typefield : TypeField?
    var hidden : Bool
    let topSpacing : Float
    let show : Int?
    let required : Bool
    
    private enum Keys : String, CodingKey {
        case id = "id"
        case type = "type"
        case message = "message"
        case typefield = "typefield"
        case hidden = "hidden"
        case topSpacing = "topSpacing"
        case show = "show"
        case required = "required"
    }
    
    // Custom decoding to fix API error on typefield
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        type = try container.decode(Type.self, forKey: .type)
        message = try container.decode(String.self, forKey: .message)
        
        if let intChecker = try? container.decode(Int.self, forKey: .typefield) {
            typefield = TypeField(rawValue: intChecker)
        } else {
            if let stringChecker = try?  container.decode(String.self, forKey: .typefield){
                switch stringChecker {
                case "text":
                    typefield = TypeField.text
                case "telnumber":
                    typefield = TypeField.telNumber
                case "email":
                    typefield = TypeField.email
                default:
                    typefield = TypeField.null
                }
            } else{
                typefield = TypeField.null
            }
        }
        
        hidden = try container.decode(Bool.self, forKey: .hidden)
        topSpacing = try container.decode(Float.self, forKey: .topSpacing)
        show = try? container.decode(Int.self, forKey: .show)
        required = try container.decode(Bool.self, forKey: .required)
        
    }
}

struct Celulas : Codable{
    let cells : [Celula]
}

struct CelulasRequest {
}

struct CelulasResponse {
    var celulas : [Celula]
}

struct CelulasViewModel {
    var displayedCelulas : [Celula]
}

struct FormModel {
    let name: String
    let email: String?
    let telNumber: String
}
