//
//  InvestimentoWorker.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

protocol InvestimentoServiceProtocol {
    func fetchScreen(completitionHandler: @escaping (ParentScreen) -> Void)
}

class InvestimentoWorker {
    var investimentoService: InvestimentoServiceProtocol
    
    init(investimentoService: InvestimentoServiceProtocol){
        self.investimentoService = investimentoService
    }
    
    func fetchScreen(completition: @escaping (Screen) -> Void){
        investimentoService.fetchScreen{ (screen: ParentScreen) in
            completition(screen.screen)
        }
    }
}
