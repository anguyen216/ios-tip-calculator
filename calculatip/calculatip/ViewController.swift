//
//  ViewController.swift
//  calculatip
//
//  Created by Anh Nguyen on 12/17/20.
//

import UIKit

class ViewController: UIViewController {
  // values/fields setup
  @IBOutlet weak var billAmount: UITextField!
  @IBOutlet weak var tipAmount: UILabel!
  @IBOutlet weak var totalAmount: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var numPerson: UILabel!
  @IBOutlet weak var peopleStepper: UIStepper!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    numPerson.text = "1 Person"
    self.billAmount.becomeFirstResponder()
    
  }


  @IBAction func stepperValueChange(_ sender: UIStepper) {
    // Changing the number of people to split the bill
    let people = Int(sender.value).description
    if people == "1" {
        numPerson.text = "\(people) Person"
    } else {
        numPerson.text = "\(people) People"
    }
  }
  
  
  @IBAction func calculateTip(_ sender: Any) {
    // Computing tip and total amount
    // set up
    let tipPercentages = [0.1, 0.15, 0.2, 0.25]
    let split = peopleStepper.value
    let bill = Double(billAmount.text!) ?? 0
    let p = tipPercentages[tipControl.selectedSegmentIndex]
    
    // compute tip and total amount
    let tip = bill * p
    let total = (tip + bill) / split
    
    // update label fields
    totalAmount.text = String(format: "$%.2f", total)
    tipAmount.text = String(format: "$%.2f", tip / split)
    
  }
  
  
  @IBAction func onSwipe(_ sender: Any) {
    // reset calculator by swiping in the bill amount area
    let bill = Double(billAmount.text!) ?? 0
    if bill > 0 {
      billAmount.text = ""
      totalAmount.text = ""
      tipAmount.text = ""
      peopleStepper.value = 1
      numPerson.text = "1 Person"
    }
  }
  
}

