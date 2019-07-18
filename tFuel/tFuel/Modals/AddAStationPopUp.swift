//
//  AddAStationPopUp.swift
//  tFuel
//
//  Created by Jacob Pyke on 18.07.19.
//  Copyright © 2019 Riccardo Mores. All rights reserved.
//

import UIKit

class AddAStationPopUp: UIViewController {


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
        preferredContentSize = CGSize(width: 200, height: 600)
        // Do any additional setup after loading the view.
        
        
    }
    
    func configureUI(titleText: String) {
        // MARK: Main Title & SubTitle
        // Title
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        titleLabel.center = CGPoint(x: 160, y: 285)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.text = titleText
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        // Subtitle
        let streetLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        streetLabel.center = CGPoint(x: 160, y: 285)
        streetLabel.textAlignment = .center
        streetLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        streetLabel.text = "1 Infinite Loop, Apple Park, CT"
        self.view.addSubview(streetLabel)
        streetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: The Circular Views
        // Petrol Station Name
        let circleview1 = UIView()
        circleview1.backgroundColor = UIColor(named: "accentcolor")!
        circleview1.translatesAutoresizingMaskIntoConstraints = false
        circleview1.layer.cornerRadius = 10
        // Label
        let addAFuelStation = UILabel()
        addAFuelStation.text = ""
        circleview1.addSubview(addAFuelStation)
        addAFuelStation.translatesAutoresizingMaskIntoConstraints = false
        // Address
        let circleview2 = UIView()
        circleview2.backgroundColor = UIColor(named: "accentcolor")!
        circleview2.translatesAutoresizingMaskIntoConstraints = false
        circleview2.layer.cornerRadius = 10
        // Diesel Price
        let circleview3 = UIView()
        circleview3.backgroundColor = UIColor(named: "accentcolor")!
        circleview3.translatesAutoresizingMaskIntoConstraints = false
        circleview3.layer.cornerRadius = 10
        //Gasoline Price
        let circleview4 = UIView()
        circleview4.backgroundColor = UIColor(named: "accentcolor")!
        circleview4.translatesAutoresizingMaskIntoConstraints = false
        circleview4.layer.cornerRadius = 10
        
        // MARK: Layout Rows
        let row = UIStackView(arrangedSubviews: [circleview1, circleview2])
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.spacing = 20
        row.backgroundColor = .red
        self.view.addSubview(row)
        row.translatesAutoresizingMaskIntoConstraints = false
        let row2 = UIStackView(arrangedSubviews: [circleview3, circleview4])
        row2.axis = .horizontal
        row2.distribution = .fillEqually
        row2.spacing = 20
        row2.backgroundColor = .red
        self.view.addSubview(row2)
        row2.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: Constraints
        NSLayoutConstraint.activate([
            // Title & SubTitle
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            streetLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            streetLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            
            // Layout Rows
            row.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0),
            row.heightAnchor.constraint(equalToConstant: 120),
            row.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            row.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: view.trailingAnchor, multiplier: 3),
            row.topAnchor.constraint(equalToSystemSpacingBelow: streetLabel.bottomAnchor, multiplier: 2),
            row2.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0),
            row2.heightAnchor.constraint(equalToConstant: 120),
            row2.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            row2.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: view.trailingAnchor, multiplier: 3),
            row2.topAnchor.constraint(equalToSystemSpacingBelow: row.bottomAnchor, multiplier: 2),
            
            
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
