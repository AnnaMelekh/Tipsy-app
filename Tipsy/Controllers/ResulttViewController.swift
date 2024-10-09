//
//  ResulttViewController.swift
//  Tipsy
//
//  Created by Anna Melekhina on 09.10.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResulttViewController: UIViewController {
    
    var sum: Float = 0
    var numberOfPeople: Float = 0
    var tip: Float = 0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(sum)
        settingLabel.text = "Split between \(Int(numberOfPeople)) people \n with \(Int(tip))% tip"
        
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

