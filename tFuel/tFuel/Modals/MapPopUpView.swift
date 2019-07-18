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
    var stationAddress: String?
    
    convenience init(stationTitle: String, stationAddress: String) {
        self.init()
        self.stationTitle = stationTitle
        self.stationAddress = stationAddress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "bgcolor")!
        if let stationTitle = stationTitle, let stationAddress = stationAddress {
            title = stationTitle
            configureUI(titleText: stationTitle, addressText: stationAddress)
        } else {
            title = "Error"
        }
        preferredContentSize = CGSize(width: 200, height: 600)
        // Do any additional setup after loading the view.
        
        
    }
    
    func configureUI(titleText: String, addressText: String) {
        // MARK: Main Title & SubTitle
        // Title
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        titleLabel.center = CGPoint(x: 160, y: 285)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.text = titleText
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        // Subtitle
        let streetLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        streetLabel.center = CGPoint(x: 160, y: 285)
        streetLabel.textAlignment = .center
        streetLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        streetLabel.text = addressText
        self.view.addSubview(streetLabel)
        streetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: The Circular Views
        // MARK: Petrol Price
        let circleview1 = UIView()
        circleview1.backgroundColor = UIColor(named: "accentcolor")!
        circleview1.translatesAutoresizingMaskIntoConstraints = false
        circleview1.layer.cornerRadius = 10
            // Title Label
        let gasolineStationLabel = UILabel()
        gasolineStationLabel.text = "Gasoline Price"
            // Price Label
        let actualGasolinePrice = UILabel()
        actualGasolinePrice.text = "1.40"
        actualGasolinePrice.font = UIFont.boldSystemFont(ofSize: 45)
            // Stack View
        let gasolineStack = UIStackView(arrangedSubviews: [gasolineStationLabel, actualGasolinePrice])
        gasolineStack.axis = .vertical
        gasolineStack.alignment = .center
        circleview1.addSubview(gasolineStack)
        gasolineStack.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Diesel Price
        let circleview2 = UIView()
        circleview2.backgroundColor = UIColor(named: "accentcolor")!
        circleview2.translatesAutoresizingMaskIntoConstraints = false
        circleview2.layer.cornerRadius = 10
            // Title Label
        let dieselStationLabel = UILabel()
        dieselStationLabel.text = "Diesel Price"
            // Price Label
        let actualDieselPrice = UILabel()
        actualDieselPrice.text = "1.17"
        actualDieselPrice.font = UIFont.boldSystemFont(ofSize: 45)
            // Stack View
        let dieselStack = UIStackView(arrangedSubviews: [dieselStationLabel, actualDieselPrice])
        dieselStack.axis = .vertical
        dieselStack.alignment = .center
        circleview2.addSubview(dieselStack)
        dieselStack.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Get Directions Button
        let circleview3 = UIView()
        circleview3.backgroundColor = UIColor(named: "accentcolor")!
        circleview3.layer.cornerRadius = 10
        self.view.addSubview(circleview3)
        circleview3.translatesAutoresizingMaskIntoConstraints = false
            // Icon
        let directionIcon = UIImage(systemName: "map")!
        let directionIconView = UIImageView(image: directionIcon)
            // Label
        let directionLabel = UILabel()
        directionLabel.text = "Get Directions"
            // StackView
        let directionButtonStack = UIStackView(arrangedSubviews: [directionIconView, directionLabel])
        directionButtonStack.spacing = 8
        circleview3.addSubview(directionButtonStack)
        directionButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Report Issues Button
        let circleview4 = UIView()
        circleview4.backgroundColor = UIColor(named: "accentcolor")!
        circleview4.translatesAutoresizingMaskIntoConstraints = false
        circleview4.layer.cornerRadius = 10
        self.view.addSubview(circleview4)
        circleview4.translatesAutoresizingMaskIntoConstraints = false
            // Icon
        let reportIssueIcon = UIImage(systemName: "exclamationmark.circle")!
        let reportIssueIconView = UIImageView(image: reportIssueIcon)
            // Label
        let reportIssueLabel = UILabel()
        reportIssueLabel.text = "Report An Issue"
            // StackView
        let reportAnIssueStack = UIStackView(arrangedSubviews: [reportIssueIconView, reportIssueLabel])
        reportAnIssueStack.spacing = 8
        circleview4.addSubview(reportAnIssueStack)
        reportAnIssueStack.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Layout Rows
        let row = UIStackView(arrangedSubviews: [circleview1, circleview2])
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.spacing = 20
        row.backgroundColor = .red
        self.view.addSubview(row)
        row.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: Constraints
        NSLayoutConstraint.activate([
            // MARK: Title & SubTitle
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            streetLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            streetLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            // MARK: Bubble Rows
            row.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0),
            row.heightAnchor.constraint(equalToConstant: 120),
            row.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            row.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: view.trailingAnchor, multiplier: 2),
            row.topAnchor.constraint(equalToSystemSpacingBelow: streetLabel.bottomAnchor, multiplier: 2),
            
            // MARK: Gasoline View
            gasolineStack.centerXAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: circleview1.centerXAnchor, multiplier: 0),
            gasolineStack.centerYAnchor.constraint(equalToSystemSpacingBelow: circleview1.centerYAnchor, multiplier: 0),
            
            // MARK: Diesel View
            dieselStack.centerXAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: circleview2.centerXAnchor, multiplier: 0),
            dieselStack.centerYAnchor.constraint(equalToSystemSpacingBelow: circleview2.centerYAnchor, multiplier: 0),
            
            // MARK: Get Directions Button
                // View
            circleview3.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0),
            circleview3.heightAnchor.constraint(equalToConstant: 60),
            circleview3.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            circleview3.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.trailingAnchor, multiplier: 2),
            circleview3.topAnchor.constraint(equalToSystemSpacingBelow: row.bottomAnchor, multiplier: 2),
                // Stack
            directionButtonStack.centerYAnchor.constraint(equalToSystemSpacingBelow: circleview3.centerYAnchor, multiplier: 0),
            directionButtonStack.centerXAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: circleview3.centerXAnchor, multiplier: 0),
                // Icon
            directionIconView.heightAnchor.constraint(equalToConstant: 25),
            directionIconView.widthAnchor.constraint(equalToConstant: 25),
            
            // MARK: Report An Issue Button
                // View
            circleview4.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0),
            circleview4.heightAnchor.constraint(equalToConstant: 60),
            circleview4.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            circleview4.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.trailingAnchor, multiplier: 2),
            circleview4.topAnchor.constraint(equalToSystemSpacingBelow: circleview3.bottomAnchor, multiplier: 2),
                // Stack
            reportAnIssueStack.centerYAnchor.constraint(equalToSystemSpacingBelow: circleview4.centerYAnchor, multiplier: 0),
            reportAnIssueStack.centerXAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: circleview4.centerXAnchor, multiplier: 0),
                // Icon
            reportIssueIconView.heightAnchor.constraint(equalToConstant: 25),
            reportIssueIconView.widthAnchor.constraint(equalToConstant: 25),
            ])
    }

}
