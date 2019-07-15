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
        self.view.backgroundColor = UIColor(named: "bgcolor")!
        if let stationTitle = stationTitle {
            title = stationTitle
            configureUI(titleText: stationTitle)
        } else {
            title = "Error"
        }
        preferredContentSize = CGSize(width: 200, height: 200)
        // Do any additional setup after loading the view.
        
        
    }
    
    func configureUI(titleText: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        titleLabel.center = CGPoint(x: 160, y: 285)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.text = titleText
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let streetLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        streetLabel.center = CGPoint(x: 160, y: 285)
        streetLabel.textAlignment = .center
        streetLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        streetLabel.text = "1 Infinite Loop, Apple Park, CT"
        self.view.addSubview(streetLabel)
        streetLabel.translatesAutoresizingMaskIntoConstraints = false
        let bubbleView = UIView(frame: CGRect(x: 0, y: 0, width: 87, height: 61))
//        bubbleView.backgroundColor = UIColor(named: "accentcolor")!
//        bubbleView.layer.cornerRadius = 8
//        self.view.addSubview(bubbleView)
//        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            streetLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            streetLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            ])
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
