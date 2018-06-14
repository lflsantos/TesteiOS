//
//  SucessoViewController.swift
//  TesteiOS
//
//  Created by Lucas Santos on 27/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import UIKit

class SucessoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        self.title = "Contato"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func newForm(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
