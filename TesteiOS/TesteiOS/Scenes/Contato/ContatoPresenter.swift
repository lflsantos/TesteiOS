//
//  ContatoPresenter.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

protocol ContatoPresentationLogic {
    func presentFetchedCells(response: CelulasResponse)
}

class ContatoPresenter: ContatoPresentationLogic {
    weak var viewController : ContatoDisplayLogic?
    
    
    func presentFetchedCells(response: CelulasResponse) {
        viewController?.displayCelulas(viewModel: CelulasViewModel(displayedCelulas: response.celulas))
    }
}
