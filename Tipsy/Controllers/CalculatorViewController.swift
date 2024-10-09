//
//  ViewController.swift
//  Tipsy
//
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPCTButton: UIButton!
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        switch sender {
        case zeroPctButton:
            calculatorBrain.tip = 0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPCTButton.isSelected = false;
        case tenPctButton:
            calculatorBrain.tip = 10
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPCTButton.isSelected = false;
        case twentyPCTButton:
            calculatorBrain.tip = 20
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPCTButton.isSelected = true;
            
        default: zeroPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepper.stepValue = 1.0
        calculatorBrain.numberOfPeople = Float(stepper.value)
        splitNumberLabel.text = Int(calculatorBrain.numberOfPeople).description
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        performSegue(withIdentifier: "goToResult", sender: sender)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResulttViewController
            destinationVC.numberOfPeople = calculatorBrain.numberOfPeople
            destinationVC.tip = calculatorBrain.tip
            destinationVC.sum = getValueOfSum()
            
        }
    }
    
    func getValueOfSum() -> Float {
        
        var sum: Float = 0
        if billTextField.text == nil {
            print("expected number")
        } else {
            calculatorBrain.billEntered = Float(billTextField.text ?? "") ?? 0.0
        }
        
        sum = calculatorBrain.getValue(billEntered: calculatorBrain.billEntered )
        return sum
    }
}

