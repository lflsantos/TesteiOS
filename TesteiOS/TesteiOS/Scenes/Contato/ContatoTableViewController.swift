//
//  ContatoTableViewController.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import UIKit

protocol ContatoDisplayLogic : class {
    func displayCelulas(viewModel: CelulasViewModel)
    func displayError(viewModel: CelulasViewModel)
}

class ContatoTableViewController: UITableViewController, ContatoDisplayLogic {
    
    var interactor : ContatoInteractor?
    var celulas : [Celula] = []
    
    //MARK: - object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier.fieldCell)
        tableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil), forCellReuseIdentifier: "labelCellIdentifier")
        tableView.register(UINib(nibName: "CheckBoxTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier.checkBoxCell)
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier.buttonCell)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        let interactor = ContatoInteractor()
        let presenter = ContatoPresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }
    
    //MARK: - View lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCelulas()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK - Fetch Celulas
    func fetchCelulas(){
        let request = CelulasRequest()
        interactor?.fetchCells(request: request)
    }
    
    func displayCelulas(viewModel: CelulasViewModel) {
        celulas = viewModel.displayedCelulas
        self.tableView.reloadData()
    }
    
    func displayError(viewModel: CelulasViewModel) {
        print("Error. Could not fetch Celulas")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celulas.count
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = celulas[indexPath.row]
        switch celula.type {
        case .field:
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.fieldCell, for: indexPath) as? TextFieldTableViewCell{
                tableViewCell.celula = celula
                return tableViewCell
            }
        case .text:
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "labelCellIdentifier") as? LabelTableViewCell{
                tableViewCell.celula = celula
                return tableViewCell
            }
        case .image:
            break
        case .checkbox:
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.checkBoxCell) as? CheckBoxTableViewCell{
                tableViewCell.celula = celula
                return tableViewCell
            }
        case .send:
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.buttonCell) as? ButtonTableViewCell{
                tableViewCell.celula = celula
                return tableViewCell
            }
        }
        
        return UITableViewCell()
    }
    
    
    


    
    
    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }

}
