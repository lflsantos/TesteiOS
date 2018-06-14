//
//  InvestimentoInteractor.swift
//  TesteiOS
//
//  Created by Lucas Santos on 27/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

protocol InvestimentoBusinessLogic{
    func fetchScreen()
}

class InvestimentoInteractor : InvestimentoBusinessLogic {
    var presenter: InvestimentoPresentationLogic?
    var worker = InvestimentoWorker(investimentoService: APIService())
    
    func fetchScreen() {
        worker.fetchScreen{ (screen) -> Void in
            self.presenter?.presentFetchedScreen(screen: screen)
        }
    }
}
