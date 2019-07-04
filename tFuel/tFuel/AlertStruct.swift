//
//  AlertStruct.swift
//  tFuel
//
//  Created by Riccardo Mores on 04/07/2019.
//  Copyright © 2019 Riccardo Mores. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
