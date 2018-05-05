//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Milica Kostic on 3/31/18.
//  Copyright © 2018 Milica Kostic. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {

    //MK: Propetries
    
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var fromPicker: PickerController!
    @IBAction func convertButton(_ sender: UIButton) {
        getTheConstFromSite()
    }
    
    @IBOutlet weak var resultField: UITextField!
    @IBOutlet weak var currencyPicker: PickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueField.delegate = self
        resultField.isEnabled = false
        resultField.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide a keyboard
        textField.resignFirstResponder();
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the save button while editing
    }
    
    
    //MK: API
    func getTheConstFromSite() {
        CurrencyService.shared.getCurrencyDictionary(fromCurrency: fromPicker.getSelectedCurrency())
            .then ({ map in
                let insertedValue = Float(self.valueField.text!)
                let result: Float = Float(insertedValue!) * (map[self.currencyPicker.getSelectedCurrency()]?.floatValue)!
                
                self.resultField.text = String(result)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let controller = segue.destination as! TableViewController
        controller.pickedCurrency = fromPicker.getSelectedCurrency()
    }

}

