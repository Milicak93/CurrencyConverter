//
//  PickerController.swift
//  CurrencyConverter
//
//  Created by Milica Kostic on 4/1/18.
//  Copyright © 2018 Milica Kostic. All rights reserved.
//

import UIKit

@IBDesignable class PickerController: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource{


    //MK: Properties
 
    var selectedLine = 0
   
    let currencies = ["EUR","USD","HRK"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
       // setupPicker()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        self.delegate = self
        self.dataSource = self
       // setupPicker()
        
    }
   /*
    func setupPicker() {

        self.picker.delegate = self
        self.picker.dataSource = self
        // Setup the picker action
        
        //add picker to a stack
        addArrangedSubview(picker)
    }
    */
    
    //MK: Added methods for PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedLine = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(currencies[row])"
    }
    
    //MK: GET
    func  getSelectedCurrency() -> String {
        return currencies[selectedLine]
    }
    
}
