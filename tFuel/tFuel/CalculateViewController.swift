//
//  CalculateViewController.swift
//  tFuel
//
//  Created by Riccardo Mores on 04/07/2019.
//  Copyright © 2019 Riccardo Mores. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var calculateBtn: UIButton!
    let borderColor: UIColor = UIColor(red: 0.0/255.0, green: 0.37/255.0, blue: 0.41/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateBtn.layer.borderColor = UIColor(red: 0.0/255.0, green: 0.37/255.0, blue: 0.41/255.0, alpha: 1.0).cgColor
        calculateBtn.layer.borderWidth = 1

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
