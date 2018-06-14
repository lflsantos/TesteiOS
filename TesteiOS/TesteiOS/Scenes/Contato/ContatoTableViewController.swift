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
    func displayError()
    func formSentSuccesfully()
}

class ContatoTableViewController: UITableViewController, ContatoDisplayLogic {
    
    var interactor : ContatoInteractor?
    var celulas : [Celula] = []
    
    
    //MARK: - View lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier.fieldCell)
        self.tableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier.textCell)
        self.tableView.register(UINib(nibName: "CheckBoxTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier.checkBoxCell)
        self.tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier.buttonCell)
        
        setup()
        fetchCelulas()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setup(){
        let interactor = ContatoInteractor()
        let presenter = ContatoPresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }

    // MARK - Fetch Celulas
    func fetchCelulas(){
        let request = CelulasRequest()
        interactor?.fetchCells(request: request)
    }
    
    
    // MARK - Display Logic
    func displayCelulas(viewModel: CelulasViewModel) {
        celulas = viewModel.displayedCelulas
        self.tableView.reloadData()
    }
    
    func displayError() {
        print("Error. Could not fetch Celulas")
    }
    
    func formSentSuccesfully() {
        performSegue(withIdentifier: "formCompleted", sender: nil)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(indexPath.row)
        if(celulas[indexPath.row].hidden){
            return 0
        } else{
            return CGFloat(celulas[indexPath.row].topSpacing + 35)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celulas.count
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch celulas[indexPath.row].type {
        case .field:
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.fieldCell, for: indexPath) as? TextFieldTableViewCell{
                tableViewCell.celula = celulas[indexPath.row]
                return tableViewCell
            }
        case .text:
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.textCell) as? LabelTableViewCell{
                tableViewCell.celula = celulas[indexPath.row]
                return tableViewCell
            }
        case .image:
            break
        case .checkbox:
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.checkBoxCell) as? CheckBoxTableViewCell{
                tableViewCell.celula = celulas[indexPath.row]
                tableViewCell.checkBox.addTarget(self, action: #selector(self.checkBoxPressed(sender:)), for: .touchUpInside)
                return tableViewCell
            }
        case .send:
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.buttonCell) as? ButtonTableViewCell{
                tableViewCell.celula = celulas[indexPath.row]
                tableViewCell.button.addTarget(self, action: #selector(self.sendForm(sender:)), for: .touchUpInside)
                return tableViewCell
            }
        }
        return UITableViewCell()
    }
    
    
    // MARK: - Actions
    @objc func sendForm(sender: UIButton!){
        var index = IndexPath(row: 1, section: 0)
        var cell = tableView.cellForRow(at: index) as! TextFieldTableViewCell
        let name = cell.textField.text
        
        index = IndexPath(row: 2, section: 0)
        cell = tableView.cellForRow(at: index) as! TextFieldTableViewCell
        var email : String?
        if(cell.isValidField && !celulas[2].hidden){
            email = cell.textField.text
        } else if(!cell.isValidField && !celulas[2].hidden){
            return
        } else {
            email = ""
        }
        
        index = IndexPath(row: 3, section: 0)
        cell = tableView.cellForRow(at: index) as! TextFieldTableViewCell
        let tel = cell.textField.text
        
        //send form
        print("\(name ?? ""), \(email ?? ""), \(tel ?? "")")
        self.formSentSuccesfully()
    }
    
    @objc func checkBoxPressed(sender: UIButton!){
        if let index = celulas.index(where: {$0.typefield == TypeField.email}) {
            if sender.isSelected {
                celulas[index].hidden = false
            } else {
                celulas[index].hidden = true
            }
            self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: UITableViewRowAnimation.automatic)
        }
    }
}
