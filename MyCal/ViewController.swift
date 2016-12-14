//
//  ViewController.swift
//  MyCal
//
//  Created by Abed on 13/12/2016.
//  Copyright © 2016 Webiaturist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLbl: UILabel!
    var leftVal = ""
    var rightVal = ""
    var theOperation = ""
    var runningNumber = ""
    var result = ""
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equal = "="
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    func caclulation(abed_operator: Operation){
        if currentOperation != Operation.Empty{
            if runningNumber != ""{
                rightVal = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Divide{
                    result = "\(Double(leftVal)! / Double(rightVal)!)"
                }
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftVal)! * Double(rightVal)!)"
                }
                if currentOperation == Operation.Add{
                    result = "\(Double(leftVal)! + Double(rightVal)!)"
                }
                if currentOperation == Operation.Subtract{
                    result = "\(Double(leftVal)! - Double(rightVal)!)"
                }
                
                leftVal = result
                resultLbl.text = result
            }
            currentOperation = abed_operator
        } else{
            leftVal = runningNumber
            runningNumber = ""
            currentOperation = abed_operator
        }
    }
    
    @IBAction func onNumberPressed(sender: UIButton){
        runningNumber += "\(sender.tag)"
        resultLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject){
        caclulation(abed_operator: Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject){
        caclulation(abed_operator: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject){
        caclulation(abed_operator: .Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject){
        caclulation(abed_operator: .Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject){
        caclulation(abed_operator: currentOperation)
    }
    
    @IBAction func onClearPressed(sender: AnyObject){
        currentOperation = Operation.Empty
        leftVal = ""
        rightVal = ""
        resultLbl.text = "0"
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

