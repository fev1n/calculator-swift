//
//  CalcLogic.swift
//  Calculator-Swift
//
//  Created by Fevin Patel on 2023-11-09.
//

import Foundation

class CalcLogic {
    
    var items: Array<Double> = Array()
    
    func pushItem(number: Double) {
        items.append(number)
    }
    
    func popItem () -> Double {
            let result: Double = items.removeLast()
            return result
    }
    
    func calculate (calcOperator: String) -> Double? {
        if (items.isEmpty) {
            print("Enter numbers first!")
            return -1
        }else {
            let number1: Double  = popItem()
            let number2: Double  = popItem()
            
            switch calcOperator {
            case "%":
                return number1.truncatingRemainder(dividingBy: number2)
            case "+":
                return number1 + number2
            case "-":
                return number2 - number1
            case "/":
                if (number2 != 0) {
                    return number2 / number1
                }
                else {
                    print("Error: Division by 0!")
                    return -1
                }
            case "÷":
                if (number2 != 0) {
                    return number2 / number1
                }
                else {
                    print("Error: Division by 0!")
                    return -1
                }
            case "*":
                return number1 * number2
            case "x":
                return number1 * number2
            default:
                print("Error: Invalid operation symbol input! Please select one from [ + , - , * or / ]\n")
            }
            return -1
        }
    }
}
