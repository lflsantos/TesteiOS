//
//  ContatoInteractor.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

protocol ContatoBusinessLogic{
    func fetchCells(request : CelulasRequest)
}

protocol ContatoDataStore{
    var celulas : [Celula]? {get}
}

class ContatoInteractor : ContatoBusinessLogic, ContatoDataStore {
    var celulas: [Celula]?
    
    var presenter : ContatoPresentationLogic?
    var contatoWorker = ContatoWorker(contatoService: APIService())
    
    
    // MARK: - Fetch
    func fetchCells(request: CelulasRequest) {
        contatoWorker.fetchCells { (celulas) -> Void in
            self.celulas = celulas.cells
            let response = CelulasResponse(celulas: self.celulas!)
            self.presenter?.presentFetchedCells(response: response)
        }
    }
    
    
    
}
