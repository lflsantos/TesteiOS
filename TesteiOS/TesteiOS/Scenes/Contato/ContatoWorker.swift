//
//  ContatoWorker.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

class ContatoWorker{
    
    var contatoService : ContatoServiceProtocol
    
    init(contatoService : ContatoServiceProtocol) {
        self.contatoService = contatoService
    }
    
    func fetchCells(completition : @escaping (Celulas) -> Void){
        contatoService.fetchCells { (celulas : Celulas) in
            completition(celulas)
        }
    }
}

protocol ContatoServiceProtocol {
    func fetchCells(completitionHandler : @escaping (Celulas) -> Void)
}
