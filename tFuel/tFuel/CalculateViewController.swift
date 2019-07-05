//
//  CalculateViewController.swift
//  tFuel
//
//  Created by Riccardo Mores on 04/07/2019.
//  Copyright © 2019 Riccardo Mores. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var remainingTF: UITextField!
    @IBOutlet weak var fuelTF: UITextField!
    @IBOutlet weak var eurosTF: UITextField!
    @IBOutlet weak var calculateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // Hide keyboard when I press outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide Keyboard when I press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        remainingTF.resignFirstResponder()
        fuelTF.resignFirstResponder()
        eurosTF.resignFirstResponder()
        return (true)
    }

}
