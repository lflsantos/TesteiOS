//
//  ContatoService.swift
//  TesteiOS
//
//  Created by Lucas Santos on 12/05/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation

class ContatoService : ContatoServiceProtocol{
    
    func fetchCells(completitionHandler: @escaping (Celulas) -> Void) {
        let url = URL(string: Constants.cellsURL)
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if let data = data{
                if let celulas = self.parseJSON(data: data) {
                    completitionHandler(celulas)
                }
            } else {
                print("ERROR. Could not fetch JSON from URL")
            }
        }
        
        task.resume()
    }
    
    func parseJSON(data : Data) -> Celulas?{
        do{
            return try JSONDecoder().decode(Celulas.self, from: data)
        } catch let jsonError{
            print("ERROR. Could not parse json. \(jsonError)")
            return nil
        }
    }
}
