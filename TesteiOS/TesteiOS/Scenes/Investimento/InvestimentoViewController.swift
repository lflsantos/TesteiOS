//
//  InvestimentoTableViewController.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import UIKit

protocol InvestimentoDisplayLogic : class{
    func fetchScreen()
    func displayError()
    func setTitle(_ title: String)
    func setFundName(_ fundName: String)
    func setWhatIs(_ whatIs: String)
    func setDefinition(_ definition: String)
    func setRiskTitle(_ riskTitle: String)
    func setRisk(_ risk: Int)
    func setInfoTitle(_ infoTitle: String)
    func setMonthInfo(fund: String, CDI: String)
    func setYearInfo(fund: String, CDI: String)
    func setTwelveMonthsInfo(fund: String, CDI: String)
}

class InvestimentoViewController: UIViewController, InvestimentoDisplayLogic {
    
    
    var interactor : InvestimentoInteractor?
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fundName: UILabel!
    @IBOutlet weak var whatIs: UILabel!
    @IBOutlet weak var definition: UILabel!
    @IBOutlet weak var riskTitle: UILabel!
    @IBOutlet weak var riskBar: UISegmentedControl!
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var monthFund: UILabel!
    @IBOutlet weak var monthCDI: UILabel!
    @IBOutlet weak var yearFund: UILabel!
    @IBOutlet weak var yearDCI: UILabel!
    @IBOutlet weak var twelveFund: UILabel!
    @IBOutlet weak var twelveCDI: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setup(){
        let interactor = InvestimentoInteractor()
        let presenter = InvestimentoPresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }


    func fetchScreen() {
        interactor?.fetchScreen()
    }
    
    func displayError() {
        
    }
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
    
    func setFundName(_ fundName: String) {
        self.fundName.text = fundName
    }
    
    func setWhatIs(_ whatIs: String) {
        self.whatIs.text = whatIs
    }
    
    func setDefinition(_ definition: String) {
        self.definition.text = definition
    }
    
    func setRiskTitle(_ riskTitle: String) {
        self.riskTitle.text = riskTitle
    }
    
    func setRisk(_ risk: Int) {
        self.riskBar.selectedSegmentIndex = risk
    }
    
    func setInfoTitle(_ infoTitle: String) {
        self.infoTitle.text = infoTitle
    }
    
    func setMonthInfo(fund: String, CDI: String) {
        self.monthFund.text = fund
        self.monthCDI.text = CDI
    }
    
    func setYearInfo(fund: String, CDI: String) {
        self.yearFund.text = fund
        self.yearDCI.text = CDI
    }
    
    func setTwelveMonthsInfo(fund: String, CDI: String) {
        self.twelveFund.text = fund
        self.twelveCDI.text = CDI
    }

}
