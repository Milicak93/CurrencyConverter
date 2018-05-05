//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Milica Kostic on 4/7/18.
//  Copyright © 2018 Milica Kostic. All rights reserved.
//

import Foundation
import Promise

class CurrencyService{
    
    static let shared = CurrencyService()
    
    private var dictionary = [String: [String: NSNumber]]()
    
    func getCurrencyDictionary(fromCurrency: String) -> Promise<Dictionary<String, NSNumber>>{
    
        return Promise<Dictionary>(work: { fulfill, reject in
            if self.dictionary[fromCurrency] == nil {
                let url = URL(string:"https://api.fixer.io/latest?base=" + fromCurrency)
                let request = URLRequest(url: url!)
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    
                    if let data = data {
                        do {
                            // Convert the data to JSON
                            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                            
                            let rates = json["rates"] as! [String: NSNumber]
                            self.dictionary[fromCurrency] = rates
                            fulfill(rates)
                            
                        } catch let error as NSError {
                            reject(error)
                        }
                    } else if let error = error {
                        reject(error)
                    }
                }
               
                task.resume()
            }else{
                fulfill( self.dictionary[fromCurrency]!)
            }
        })
    
    }
    
}
