//
//  InvestimentoPresenter.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

protocol InvestimentoPresentationLogic {
    func presentFetchedScreen(screen: Screen)
}

class InvestimentoPresenter: InvestimentoPresentationLogic {
    var screen : Screen?
    
    weak var viewController: InvestimentoDisplayLogic?
    
    func presentFetchedScreen(screen: Screen) {
        DispatchQueue.main.async {
            self.viewController?.setTitle(screen.title)
            self.viewController?.setFundName(screen.fundName)
            self.viewController?.setWhatIs(screen.whatIs)
            self.viewController?.setDefinition(screen.definition)
            self.viewController?.setRiskTitle(screen.riskTitle)
            self.viewController?.setRisk(screen.risk - 1)
            self.viewController?.setInfoTitle(screen.infoTitle)
            let more = screen.moreInfo
            self.viewController?.setMonthInfo(fund: String(more.month.fund), CDI: String(more.month.CDI))
            self.viewController?.setYearInfo(fund: String(more.year.fund), CDI: String(more.year.CDI))
            self.viewController?.setTwelveMonthsInfo(fund: String(more.twelveMonths.fund), CDI: String(more.twelveMonths.CDI))
        }
    }
    
}
