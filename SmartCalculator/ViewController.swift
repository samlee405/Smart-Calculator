//
//  ViewController.swift
//  SmartCalculator
//
//  Created by Sam Lee on 11/16/16.
//  Copyright © 2016 Sam Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculationField: UILabel!
    
    var valuesArray = [String]()
    var calculationsToSendArray = [String]()
    var calculationDone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeView()
    }
    
    func intializeView() {
        calculationField.layer.borderWidth = 1.0
        calculationField.layer.cornerRadius = 5.0
    }
    
    @IBAction func numberButtonPressed(_ sender: AnyObject) {
        switch String(sender.tag) {
            case "9": if let value = calculationField.text {
                        calculationField.text = value + "9"
                      }
                      else {
                          calculationField.text = "9"
                      }
            case "8": if let value = calculationField.text {
                        calculationField.text = value + "8"
                      }
                      else {
                        calculationField.text = "8"
                      }
            case "7": if let value = calculationField.text {
                        calculationField.text = value + "7"
                      }
                      else {
                        calculationField.text = "7"
                      }
            case "6": if let value = calculationField.text {
                        calculationField.text = value + "6"
                      }
                      else {
                        calculationField.text = "6"
                      }
            case "5": if let value = calculationField.text {
                        calculationField.text = value + "5"
                      }
                      else {
                        calculationField.text = "5"
                      }
            case "4": if let value = calculationField.text {
                        calculationField.text = value + "4"
                      }
                      else {
                        calculationField.text = "4"
                      }
            case "3": if let value = calculationField.text {
                        calculationField.text = value + "3"
                      }
                      else {
                        calculationField.text = "3"
                      }
            case "2": if let value = calculationField.text {
                        calculationField.text = value + "2"
                      }
                      else {
                        calculationField.text = "2"
                      }
            case "1": if let value = calculationField.text {
                        calculationField.text = value + "1"
                      }
                      else {
                        calculationField.text = "1"
                      }
            case "0": if let value = calculationField.text {
                        calculationField.text = value + "0"
                      }
                      else {
                        calculationField.text = "0"
                      }
            case "0": if let value = calculationField.text {
                        calculationField.text = value + "0"
                      }
                      else {
                        calculationField.text = "0"
                      }
            default: break
        }
    }
    @IBAction func operationButtonPressed(_ sender: AnyObject) {
        
        switch String(sender.tag) {
            case "10": print("Operation pressed: ÷")
            case "11": print("Operation pressed: ×")
            case "12": print("Operation pressed: -")
            case "13": print("Operation pressed: +")
            default: break
        }
        
        if calculationField.text == nil {
            calculationField.text = "0"
            valuesArray.append(calculationField.text!)
            switch String(sender.tag) {
                case "10": valuesArray.append("÷")
                           calculationField.text = nil
                case "11": valuesArray.append("×")
                           calculationField.text = nil
                case "12": valuesArray.append("-")
                           calculationField.text = nil
                case "13": valuesArray.append("+")
                           calculationField.text = nil
                default: break
            }
        }
        else {
            valuesArray.append(calculationField.text!)
            switch String(sender.tag) {
                case "10": valuesArray.append("÷")
                           calculationField.text = nil
                case "11": valuesArray.append("×")
                           calculationField.text = nil
                case "12": valuesArray.append("-")
                           calculationField.text = nil
                case "13": valuesArray.append("+")
                           calculationField.text = nil
                default: break
            }

        }
    }
    @IBAction func negateButtonPressed(_ sender: AnyObject) {
        if let value = calculationField.text {
            calculationField.text = "-" + value
        }
    }
    @IBAction func deleteButtonPressed(_ sender: AnyObject) {
        if let value = calculationField.text {
            calculationField.text = String(value.characters.dropLast())
        }
    }
    @IBAction func clearButtonPressed(_ sender: AnyObject) {
        calculationField.text = nil
    }
    @IBAction func equalsButtonPressed(_ sender: AnyObject) {
//        for item in valuesArray {
//            switch item {
//                case "÷": valuesArray.append(calculationField.text!);
//                valuesArray.append("÷")
//                case "×": valuesArray.append(calculationField.text!);
//                valuesArray.append("×")
//                case "-": valuesArray.append(calculationField.text!);
//                valuesArray.append("-")
//                case "+": valuesArray.append(calculationField.text!);
//                valuesArray.append("+")
//                default: break
//            }
//        }
        
        valuesArray.append(calculationField.text!)
        
        let firstValue = Float(valuesArray[0])
        let secondValue = Float(valuesArray[2])
        let operation = valuesArray[1]
        
        var result: Float?
        
        switch operation {
            case "÷": result = firstValue! / secondValue!
            case "×": result = firstValue! * secondValue!
            case "-": result = firstValue! - secondValue!
            case "+": result = firstValue! + secondValue!
        default: break
        }
        
        // Display result in label
        if let unwrappedResult = result {
            calculationField.text = String(describing: unwrappedResult)
            
            let completeCalculation = "\(firstValue!) \(operation) \(secondValue!) = \(unwrappedResult)"
            calculationsToSendArray.append(completeCalculation)
        }
        else {
            print("Error in displaying result")
        }
        
        calculationDone = true
        valuesArray = [] //reinitialize the array for future operations
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! CalculationTableTableViewController
        destination.calculationsArray = calculationsToSendArray
        print(destination.calculationsArray)
    }
}

