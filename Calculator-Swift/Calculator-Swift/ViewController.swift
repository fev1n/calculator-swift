//
//  ViewController.swift
//  Calculator-Swift
//
//  Created by Fevin Patel on 2023-11-09.
//

import UIKit

class ViewController: UIViewController {
    
    var calcObj: CalcLogic!
    var isNewNumber : Bool = true
    var result: Double = 0.0

    @IBOutlet weak var calcDidplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNewNumber = true;
        calcObj = CalcLogic()
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if isNewNumber {
            calcDidplay.text = sender.titleLabel?.text;
            isNewNumber = false
        }
        else {
            calcDidplay.text = "\(calcDidplay.text!)\(sender.titleLabel!.text!)"
        }
    }
    
    @IBAction func oprtrPressed(_ sender: UIButton) {
        calcDidplay.text = sender.titleLabel?.text;
        
        result = calcObj.calculate(calcOperator: calcDidplay.text!) ?? 0.0
        
        let resultString = String(format: "%.2f", result)
        calcDidplay.text = resultString
    }
    
    @IBAction func enterPressed(_ sender: UIButton) {
        if let inputValue = Double(calcDidplay.text ?? "0") {
            calcObj.pushItem(number: inputValue)
               }
               isNewNumber = true
               calcDidplay.text = "0"
    }
    
    
    @IBAction func negataionPressed(_ sender: Any) {
        if let inputValue = calcDidplay.text {
            if let doubledInputValue = Double(inputValue) {
                let result = doubledInputValue * -1
                calcDidplay.text = "\(result)"
            }
        }
    }
    
    
    @IBAction func acPressed(_ sender: Any) {
        calcDidplay.text = "0"
        calcObj.items.removeAll()
    }
}

