//
//  ConverterViewController.swift
//  HloSwft
//
//  Created by Boss on 02.04.16.
//  Copyright © 2016 PetroKov_LSR_P. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    let rubUsdMult = 1/67.67
    let usdRubMult = 63.0

    @IBOutlet weak var rubInput: UITextField!

    @IBOutlet weak var dollarInput: UITextField!
    @IBAction func rubToUsd(sender: AnyObject) {
        convertToUsd()
    }
    
    @IBAction func usdToRub(sender: AnyObject) {
        convertUsbToRub()
    }
    
    func convertToUsd(){
        guard let rubs = Double(rubInput.text!) else { return}
        let result = String(rubs * rubUsdMult)
        dollarInput.text = result
    }
    
    func convertUsbToRub(){
        guard let usd = Double(dollarInput.text!) else {return}
        let result = String(usd * usdRubMult)
        rubInput.text = result;
    }
}
