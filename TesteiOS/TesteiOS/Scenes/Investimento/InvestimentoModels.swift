//
//  InvestimentoModels.swift
//  TesteiOS
//
//  Created by Lucas Santos on 27/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

struct ParentScreen : Codable {
    let screen : Screen
}

struct Screen : Codable{
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: MoreInfo
    let info: [Info]
    let downInfo: [Info]
}

struct MoreInfo : Codable{
    let month: SubMoreInfo
    let year: SubMoreInfo
    let twelveMonths: SubMoreInfo
    
    private enum CodingKeys : String, CodingKey{
        case month, year, twelveMonths = "12months"
    }
}

struct SubMoreInfo: Codable{
    let fund: Float
    let CDI: Float
}

struct Info : Codable{
    let name: String
    let data: String?
}
