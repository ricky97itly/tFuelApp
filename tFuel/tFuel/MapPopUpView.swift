//
//  MapPopUpView.swift
//  tFuel
//
//  Created by Jacob Pyke on 14.07.19.
//  Copyright © 2019 Riccardo Mores. All rights reserved.
//

import UIKit

class MapPopUpView: UIViewController {
    
    var stationTitle: String?
    
    convenience init(stationTitle: String) {
        self.init()
        self.stationTitle = stationTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let stationTitle = stationTitle {
            title = stationTitle
        } else {
            title = "Error"
        }
        preferredContentSize = CGSize(width: 200, height: 200)
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
