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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeView()
    }

    func intializeView() {
        calculationField.layer.borderWidth = 1.0
    }


}

