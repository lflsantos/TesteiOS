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
    var celulas : [CelulasViewModel] = []
    
    //MARK: - object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
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
        //generate view
    }
    
    func displayError(viewModel: CelulasViewModel) {
        print("Error. Could not fetch Celulas")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    


    
    
    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }

}
